#!/usr/bin/env python3
# coding: utf-8
import html.parser
from datetime import datetime, timedelta
from bottle import run, template, redirect, request, debug, route, static_file, error, post, response
import os
import random
from model.jobs_model import Token
from model.jobs_model import JobsModel
from time import gmtime, strftime, mktime
from controller.send_grid import SendGridEmail
from model.jobs_model import Curriculum



@route('/')
def inicio():
    num=0
    db = JobsModel()
    jobs = db.list_jobs(0)
    return template('list_job', {'jobs': jobs, 'numero':num,'pagination':1})


@route('/static/<filename:path>')
def static(filename):
    return static_file(filename, root='static/')

@route('/job/<id>')
def jobs(id):
    vaga = JobsModel()
    job = vaga.find_id(id)
    return template('job',{'job':job})

@post('/search')
def search():
    a = request.forms.pass_key
    b = JobsModel()
    results = b.search_jobs(a)

    return template('search', {'results': results})


@route('/about')
def about():
    return template('about')

@route('/upload', method='POST')
def send_mail():
    #request of form
    id_job = request.forms.id_job
    nome = request.forms.name
    email = request.forms.email
    message = request.forms.category
    title = request.forms.title_job
    file = request.files.upload

    #Armazenar o caminho do pdf
    save_path = os.getcwd().format(category=email)
    if not os.path.exists(save_path):
        os.makedirs(save_path)
    file_path = "{path}/{file}".format(path=save_path, file=file.filename)
    file.save(file_path)

    envio = SendGridEmail()
    searchEMail = JobsModel()
    toPeopleEmail = searchEMail.findEmailBussniss(id_job)
    envio.send_rh(nome,email,message, file_path,toPeopleEmail, id_job,title)

    #remover o pdf
    os.remove(file_path)
    return redirect('/success')

@route('/success')
def success():
    return template('success.html')

@post('/sendMail')
def email():
    apply = request.forms.id_job
    id = {'apply': apply}
    print(apply)
    return template('sendMail', {'id_job': id})

@route('/page/<num>')
def page(num):
    num = int(num)
    db = JobsModel()
    jobs = db.list_jobs(num)
    pagination = (db.count_jobs() / 5)
    if num > pagination:
        return redirect('/')
    else:
        return template('list_job', {'jobs': jobs,'numero':num,'pagination':round(pagination)})



@route('/new')
def new_job():
    return template('new_job')


@route('/contact')
def s():
    return template('contact.html')

@post('/contactSend')
def contactSend():
    try:
        name = request.forms.name
        email = request.forms.email
        message = request.forms.message
        envio = SendGridEmail()
        envio.send_me(name,email,message)
        return redirect('/success')
    except Exception as e:
        return e

@post('/add')
def add_job():
    #request for form
    title = request.forms.title
    location = request.forms.location
    business = request.forms.business
    salary = request.forms.salary
    description = request.forms.description
    email = request.forms.email
    date_valid = request.forms.date_valid
    coin = request.forms.coin
    period_pay = request.forms.period_pay
    linkjob = request.forms.linkjob
    #data mongodb
    job_json = {
                'title': title,
                'location': location,
                'description': description,
                'business': {
                    'name':business,
                    'email':email,
                },
                'salary': {
                    'value': salary,
                    'coin': coin,
                    'period_pay': period_pay
                },
                'date_valid': date_valid,
                'date_post': strftime("%Y-%m-%d", gmtime()),
                'link': linkjob
                }
    #add in mongo
    w = JobsModel()
    w.add_jobs(job_json)
    return redirect('/success')


@route('/manager/')
@route('/manager')
def manager():
    if not request.get_cookie('token'):
        return template('token.html')
    else:
        return redirect('/manager/'+request.get_cookie('token'))

@route('/manager/<token>')
def manager_job(token):
    futuro = datetime.now()
    futuro += timedelta(days=1)
    m_j = JobsModel()
    m_t = Token()
    if not m_t.find_token(token):
        return redirect('/')
    else:
        if not request.get_cookie('token'):
            response.set_cookie("token", token, expires=mktime(futuro.timetuple()),path='/')
        v = m_t.find_token(token)
        vagas = m_j.find_jobs_email(v[0]['email'])
        return template('manager_rh.tpl', {'vagas': vagas})




@route('/manager/delete/<id>')
def delete_job(id):
    token = Token()
    v = JobsModel()
    if request.get_cookie('token'):
        email = token.find_token(request.get_cookie('token'))
        job = v.find_id(id)

        if email[0]['email'] == job['business']['email']:
            v.remove_jobs(id)
            return redirect('/manager')
        else:
            redirect('/manager')
    else:
        redirect('/manager')

@route('/manager/edit/<job>')
def edit_job(job):
    token = Token()
    v = JobsModel()
    if request.get_cookie('token'):
        email = token.find_token(request.get_cookie('token'))
        job = v.find_id(job)

        if email[0]['email'] == job['business']['email']:
            return template('edit',{'job':job})
        else:
            redirect('/manager')
    else:
        redirect('/manager')

@post('/manager/update/<id>')
def update_job(id):
    token = Token()
    v = JobsModel()
    if request.get_cookie('token'):
        email = token.find_token(request.get_cookie('token'))
        job = v.find_id(id)

        if email[0]['email'] == job['business']['email']:
            title = request.forms.title
            location = request.forms.location
            business = request.forms.business
            salary = request.forms.salary
            description = request.forms.description
            email = request.forms.email
            date_valid = request.forms.date_valid
            coin = request.forms.coin
            period_pay = request.forms.period_pay
            if not request.forms.linkjob:
                 linkjob = False
            else:
                linkjob = request.forms.linkjob

            # data mongodb
            job_json = {
                'title': title,
                'location': location,
                'description': description,
                'business': {
                    'name': business,
                    'email': email,
                },
                'salary': {
                    'value': salary,
                    'coin': coin,
                    'period_pay': period_pay
                },
                'date_valid': date_valid,
                'date_post': strftime("%Y-%m-%d", gmtime()),
                'link':linkjob
            }
            # add in mongo
            w = JobsModel()
            w.update_job(id, job_json)

        else:
            redirect('/manager')
    else:
        redirect('/manager')


@post('/sendmanager')
def manager_email():
    ctoken = Token()
    email = request.forms.email
    SendToken = SendGridEmail()
    token = ''.join(random.choice('0123456789ABCDEFGHIJKLMNOPQSRVTUWYZabcdefghiklmnopq') for i in range(16))
    ctoken.insert_token(token, email)
    SendToken.send_token(token, email)
    return redirect('/success')

@route('/logout')
def delete_token():
    response.delete_cookie('token')
    return redirect('/')

@error(500)
@error(404)
@error(403)
def erro404(error):
    return template('404')
debug(True)


@route('/curriculum')
def curriculum_list():
    num = 0
    db = Curriculum()
    cur = db.list_curriculum(0)
    return template('index', {'curriculum': cur, 'numero': num, 'pagination': 1})

@route('/curriculum/<id_cur>')
def curriculum_id(id_cur):
    db = Curriculum()
    return template('curriculum.html',{'curriclum':db.find_id(id_cur)})

@route('/curriculum/busca/<texto>')
def search_curriculum(texto):
    cur = Curriculum()
    results = cur.search_curriculum(texto)
    return template('search', {'results': results})

@route('/new-curriculum')
def new_curriculum():
    return template('new_curriculum')

@post('/add-curriculum')
def add_curriculum():
    pass

@post('/candidato/remove-curriculum/<id>')
def remove_curriculum(id):
    token = Token()
    v = Curriculum()
    if request.get_cookie('token'):
        email = token.find_token(request.get_cookie('token'))
        cur = v.find_id(id)

        if email[0]['email'] == cur['data_people']['email']:
            v.remove_jobs(id)
            return redirect('/candidato')
        else:
            redirect('/candidato')
    else:
        redirect('/candidato')

@post('/candidato/edit-curriculum/')
def edit_curriculum():
    return template('curriculum_edit',{'cur':cur})

@route('/candidato/<token>')
def maanger_candidato(token):
    pass

run(host='localhost',port=8083)