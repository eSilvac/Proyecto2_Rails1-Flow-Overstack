module QuestionsHelper
	def form_title
	  	@question.new_record? ? "Publicar Pregunta" : "Editar Pregunta"
	end
end
