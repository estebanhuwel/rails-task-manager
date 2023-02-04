# README

Vamos a crear un To-Do Manager con las funcionalidades CRUD:

1-Como usuario, puedo hacer una lista de tareas
2-Como usuario, puedo ver los detalles de una tarea
3-Como usuario, puedo agregar una nueva tarea
4-Como usuario, puedo editar una tarea (marcarla como completada / actualizar su título y detalles)
5-Como usuario, puedo eliminar una tarea

MODELO
  -Generamos el modelo Task por medio del generador de Rails adecuado
    title, como string
    details, como text
    completed, como boolean (default: false)

  -rails generate model Task title:string details:text completed:boolean

CONTROLADOR
  -Generamos el controlador TasksController
  -rails g controller TasksController

DB:MIGRATE
  -Cuando trate de ver la vista tuve que migrar, porque habia creado la tabla
  -por lo tanto con el comando "rails db:migrate" pude llamar la migracion

PROCESO DE CRECION WEB
  - definimos nuestra ruta -> get "tasks", to: "tasks#index"
  - vamos al cntrolador a definir la accion index
  - vamos a las vistas y generamos la vista index.html.erb

  - creamos un par de ejemplos en nuestra base de datos, para eso, generamos el comando rails c en la terminal y creamos nuestra DB, dos ejemplos para empezar
    ** Task.create(title: "Laundry", details: "Do not mix colors!")
    ** Task.create(title: "Studying", details: "A lot of flashcards to do", completed: true)

  - una vez que tenemos los dos ejemplos vamos a correrlos, creando primero la variable de instancia @tasks = Task.all en nuestro controlador index

  - y luego creando la lista en nuestra vista index.html.erb, con el siguiente codigo
      ** <% @tasks.each do |task| %>
            <li><%= task.title %></li>
         <% end %>

  - como queremos crear una expansion de los detalles, tenemos que generar en nuestra vista index un link_to, con eso vamos directamente a lo que serian nuestro elemento solo
      ** <% @tasks.each do |task| %>
            <li><%= link_to task.title, task_path(task.id) %></li>
         <% end %>

  - nos falta la ruta que creamos por medio de este codigo
      ** get "tasks/:id", to: "tasks#show", as: :task
