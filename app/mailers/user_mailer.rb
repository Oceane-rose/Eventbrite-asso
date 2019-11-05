class UserMailer < ApplicationMailer
	default from: 'fun@eventbrite-asso.com'
	
	def welcome_email(user)
	    @user = user 
	    @url  = 'http://eventbrite-asso.fr/login' 
    	mail(to: @user.email, subject: 'Bienvenue chez nous !') 
	end
	def participation_email(attendance)
	    @user = User.find(attendance.user_id)
	    @event = Event.find(attendance.event_id)
	    @url  = 'http://eventbrite-asso.fr/login' 
    	mail(to: @user.email, subject: 'Vous êtes inscrit à #{@event.title}!') 
	end
end
