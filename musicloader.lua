return function(Name,URL)
writefile(Name, game:HttpGet(URL)) 
  task.wait()
  getcustomasset(Name)
end
