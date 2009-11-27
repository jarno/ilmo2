@amount = 0
if ENV['amount']
	@amount = ENV['amount'].to_i
	if @amount > 1000
		@amount = 1000
	end
	if @amount < 0
		@amount = 0
	end
else
	@amount = 0
end
p "Amount: #{@amount}"
if ENV['del']
	p "Deleting all."
	Course.delete_all
end	
 
# following arrays blatantly copied due to lack of imagination
@levels = ["Introduction to ", "Advanced ", "A quick glimpse of ", "Beyond ", "Tips and tricks of ", "In depth analysis of ", "Code camp: "]
@adjectives = ["Enterprise", "Agile", "Integrated", "Rich interface", "Social", "Service-oriented", "Scalable", "User-centric", "Proactive","Solution-centric", "Autonomous", "Unsupervised", "Mobile","Discrete", "Holistic", "Principles of", "In depth","Performance Modeling for"]
@buzzwords = ["Ruby on Rails", "SAAS", "JBoss", "Ajax", "Design Pattern","Innovation", "Web 2.0", "Struts", "J2EE", "Blog", "Microblogging","Social Network", "Wiki", "Cloud", "Infrastructure","Business Services", "Machine Learning", "Middleware", "Compilers","Biodatabase", "Object-Relational Mapping", "Web Services", "SOAP","CORBA", "Business Intelligence", "BDD", "TDD", "C", "C++", "C#","Java", "Database", "Python", "Jython", "Pascal", "ERP", ".NET"] 
@nouns = ["Development", "Testing", "Programming", "Technologies", "Frameworks", "Reporting", "Data Mining", "Integration", "Design", "Analysis"]
 
@periodi = ["1. periodi", "2. periodi", "3. periodi", "4. periodi"]
@vuosi = ["2010", "2011", "2012", "2013", "2014"]
@aika = ["08-10", "10-12", "12-14", "14-16", "16-18"]
@assari = ["Null Pointer", "Jarno Kyykkä", "Paska Jätkä", "Ass Sari", "Chuck Norris"]
 
@amount.times do
	@le =  @levels[rand(@levels.size)]
	@ad =  @adjectives[rand(@adjectives.size)]
	@bu =  @buzzwords[rand(@buzzwords.size)]
	@no =  @nouns[rand(@nouns.size)]
	@name = "#{@le}#{@ad} #{@bu} #{@no}"
	p @name
	@desc =  "A new, #{@ad} approach to #{@bu} #{@no}"
	Course.create(:name => @name, :description => @desc)
end
 
c = Course.find(:all)
 
c.each do |kurssi|
	(rand(5)+1).times do
	        pe = @periodi[rand(@periodi.size)] + @vuosi[rand(@vuosi.size)]
  
		aasi = kurssi.course_instances.create(:name => pe)
		(rand(4)+2).times do
			ai = @aika[rand(@aika.size)]
			ass = @assari[rand(@assari.size)]
			aasi.groups.create(:assistant => ass, :time => ai)
		end
 
	end
end