FROM python
#Entra no diretario de trabalho, criado para colocar a aplicação
WORKDIR /app
#baixar as dependencias do projeto
COPY requirements.txt .
RUN pip install -r requirements.txt
#Peguei todo o conteudo e coloquei no /app
COPY . /app/
#Declara que estou usando a porta 5000 
EXPOSE 5000
#Comando de inicialização do container só é executado no 
# momento de execução da imagem e não na construção, passos acima
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]
