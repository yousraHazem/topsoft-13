module ProjectsHelper

  #returns all the projects in the table
  #by sarah ahmed
	def get_all_projects
		return Project.order("projects.id ASC")
	end
end
