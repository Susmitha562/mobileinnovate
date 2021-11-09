class Userinnovate < ApplicationMailer
	
	def welcome_email(emp)
    @emp = emp
    @url  = 'http://example.com/login'
    mail(to: @emp.email, subject: 'Welcome to My Awesome Site')
  end
   def edit_email(emp)
    @emp = emp
    @url  = 'http://example.com/login'
    mail(to: @emp.email, subject: 'Welcome to My Edit Site')
  end
  def delete_email(emp)
    @emp = emp
    @url  = 'http://example.com/login'
    mail(to: @emp.email, subject: 'Welcome to My Edit Site')
  end
   def destroy_email(emp)
    @emp = emp
    @url  = 'http://example.com/login'
    mail(to: @emp.email, subject: 'Welcome to My Edit Site')
  end
   def restore_email(emp)
    @emp = emp
    @url  = 'http://example.com/login'
    mail(to: @emp.email, subject: 'Welcome to My Edit Site')
  end

end
