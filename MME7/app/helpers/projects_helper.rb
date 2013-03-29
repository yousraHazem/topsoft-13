module ProjectsHelper

   # authorized by sarah ahmed id:22-1278
  #returns all the projects in the table
	def get_all_projects
		return Project.order("projects.id ASC")
	end
end
