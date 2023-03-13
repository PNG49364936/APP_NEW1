class MenusController < ApplicationController
    def home
    end

    def stock 
              "Merci proposer un menu GASTRONOMIQUE basé OBLIGATOIREMENT sur une entrée, un plat principal et dessert.
              Afficher chaque recette sous forme de paragraphe car autrement lecture difficile pour le lecteur.
              Mettre en gras ENTREE, PLAT PRINCIPAL ET DESSERT. 
              Les temperatures de cuisson doivent être en celcius Merci
              Preciser comment realiser chaque recette.
              Merci proposer un menu basé sur une entrée, un plat principal et dessert.
              Les ingredients suivants doivent être utilisés  dans le menu #{last_menu.ingredient6}, #{last_menu.ingredient5}, #{last_menu.ingredient4}, mais d autres ingrédients peuvent être utilisés.
              Les ingredients suivants ne peuvent être utilisés dans le menu #{last_menu.ingredient1}, #{last_menu.ingredient2}, #{last_menu.ingredient3}
              Le type de menu est #{last_menu.type_of_menu}
              Le menu doit être #{last_menu.type_of_diet}
              La gastronomie doit être #{last_menu.type_of_cuisine}
              Le temps de preparation du menu doit être au maximum en minutes de #{last_menu.preparation_time}
              Le nombre de convives est de #{last_menu.guests}
              Lister le recapitulatif des ingredients à acheter avec les quantités #{last_menu.list_of_ingredients_with_quantity}
              Preciser le temps de preparation des recettes pour entree, plat principal et dessert
              "
    end

   
    
    

    def answer
              #code api
              require "ruby/openai"
              last_menu = Menu.last

              text=  "Merci proposer un menu GASTRONOMIQUE basé OBLIGATOIREMENT sur une entrée, un plat principal et dessert.
              Afficher chaque recette sous forme de paragraphe car autrement lecture difficile pour le lecteur.
              Mettre en gras ENTREE, PLAT PRINCIPAL ET DESSERT. 
              Les temperatures de cuisson doivent être en celcius Merci
              Preciser comment realiser chaque recette.
              Les ingredients suivants peuvent être utilisés  dans le menu #{last_menu.ingredient6}, #{last_menu.ingredient5}, #{last_menu.ingredient4}, mais d autres ingrédients peuvent être utilisés.
              Les ingredients suivants ne doivent pas être utilisés dans le menu #{last_menu.ingredient1}, #{last_menu.ingredient2}, #{last_menu.ingredient3}
              Le type de menu est #{last_menu.type_of_menu}
              Le menu doit être #{last_menu.type_of_diet}
              La gastronomie doit être #{last_menu.type_of_cuisine}
              Le temps de preparation du menu doit être au maximum en minutes de #{last_menu.preparation_time}
              Le nombre de convives est de #{last_menu.guests}
              Lister le recapitulatif des ingredients à acheter avec les quantités #{last_menu.list_of_ingredients_with_quantity}
              Preciser le temps de preparation des recettes pour entree, plat principal et dessert
              "
              #@text = text
              client = OpenAI::Client.new(access_token: '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')
              pp "A"*100, text
                  response = client.completions(
                  parameters: {
                  model: "text-davinci-003",
                  prompt: text,
                  max_tokens: 500,
                  temperature: 0.5
                }
              )
              #pp"1" * 100, response
              @answer = response['choices'][0]['text']
              pp"B" * 100, @answer
              #___________________POUR PASSER DANS SHOW.HTML.ERB
              @receipt = Receipt.new(menu_id: last_menu.id, content: @answer)
              #pp"e"*100,@receipt
                if @receipt.save
                     redirect_to menu_path(last_menu.id)
               else
                    render "new"
              end
              #-----------------------------------------
     end

    def index
            if params[:query].present?
              @menus = Menu.where("name LIKE ? OR ingredient1 LIKE ? OR ingredient2 LIKE ? OR ingredient3 LIKE ? OR ingredient4 LIKE ? OR ingredient5 LIKE ? OR ingredient6 LIKE ?", "%#{params[:query]}%", "%#{params[:query]}%","%#{params[:query]}%","%#{params[:query]}%","%#{params[:query]}%","%#{params[:query]}%","%#{params[:query]}%")
                  else
              @menus = Menu.all
                  end  
      end

    def show
      @menu = Menu.find(params[:id])
    end

    def new
      @menu = Menu.new
    end

    def create
      #pp "a" * 100
      @menu = Menu.new(params_menu)
        if @menu.save
          #pp "b" * 100

     
        redirect_to menus_answer_path
          else
        render 'new'
       end
    end

    def edit
      @menu = Menu.find(params[:id])
    end

    def update
      @receipt = Receipt.find(params[:id])
      @menu = Menu.find(params[:id])
      #pp "C"*100, @menu
    
      
      @menu.update(params_menu)
      update_menu= @menu
     
      text =  "
      Merci proposer un menu GASTRONOMIQUE basé OBLIGATOIREMENT sur une entrée, un plat principal et dessert.
      Afficher chaque recette sous forme de paragraphe car autrement lecture difficile pour le lecteur.
      Mettre en gras ENTREE, PLAT PRINCIPAL ET DESSERT. 
      Les temperatures de cuisson doivent être en celcius Merci
      Preciser comment realiser chaque recette.
      Merci proposer un menu basé sur une entrée, un plat principal et dessert.
      Les ingredients suivants doivent être utilisés  dans le menu #{update_menu.ingredient6}, #{update_menu.ingredient5}, #{update_menu.ingredient4}, mais d autres ingrédients peuvent être utilisés.
      Les ingredients suivants ne peuvent pas être utilisés dans le menu #{update_menu.ingredient1}, #{update_menu.ingredient2}, #{update_menu.ingredient3}
      Le type de menu est #{update_menu.type_of_menu}
      Le menu doit être #{update_menu.type_of_diet}
      La gastronomie doit être #{update_menu.type_of_cuisine}
      Le temps de preparation du menu doit être au maximum en minutes de #{update_menu.preparation_time}
      Le nombre de convives est de #{update_menu.guests}
      Lister le recapitulatif des ingredients à acheter avec les quantités #{update_menu.list_of_ingredients_with_quantity}
      Preciser le temps de preparation des recettes pour entree, plat principal et dessert
      "
      pp"E"*100, text
      client = OpenAI::Client.new(access_token: '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')
                  response = client.completions(
                  parameters: {
                  model: "text-davinci-003",
                  prompt: text,
                  max_tokens: 600,
                  temperature: 0.5
                }
              )
              #pp"F" * 100, response
              @answer = response['choices'][0]['text']
              #pp"G" * 100, @answer

              pp"madrid"*10,@receipt.content

              
              #Ò@receipt.content = @answer
              @receipt.update(content: @answer)

              pp"madrid2"*10,@receipt.content
              #pp "H" * 100, @receipt.content                  



              #___________________POUR PASSER DANS SHOW.HTML.ERB
                if @receipt.save
                  redirect_to menu_path(@receipt.menu_id)
                else
                  render "edit"
                end

    end 

    def destroy
      @menu = Menu.find(params[:id])
      @menu.destroy
      redirect_to menus_path, notice: "Menu #{@menu.name.capitalize}was successfully destroyed"
    end

    def mail_recipe
      @menu = Menu.find(params[:id])
      RecipeMailer.recipe_email(@menu).deliver_now
      flash[:success] = 'La recette a été envoyée par e-mail'
      redirect_to @menu
    end

    def print
      @menu = Menu.find(params[:id])
      pp"1"*100
      html_text = @menu.receipt.content.gsub(/\n/, "<br class='my-class'>")
      pp"2"*100
      html_text = html_text.gsub(/(^\w+:)/, '<strong>\1</strong>')
      pp"3"*100
      respond_to do |format|
        pp"4"*100
        format.html { render html: html_text.html_safe }
        pp"5"*100
        format.print { 
          pp"6"*100
          render plain: html_text, 
          layout: false, 
          content_type: 'text/plain', 
          charset: 'utf-8', 
          status: :ok,
          headers: {
            'Content-Disposition' => 'attachment; filename="menu.txt"',
            'X-Content-Type-Options' => 'nosniff',
            'X-Download-Options' => 'noopen',
            'X-Frame-Options' => 'SAMEORIGIN',
            'X-XSS-Protection' => '1; mode=block',
            'Content-Security-Policy' => "default-src 'self'; font-src 'https://fonts.gstatic.com'; img-src 'self' data:; object-src 'none'; script-src 'unsafe-inline' 'self'; style-src 'self' 'unsafe-inline' 'https://fonts.googleapis.com'"
          },
          js: "window.print();"
        }
      end
    end


    private
    def params_menu
     params.require(:menu).permit(:name, :type_of_menu, :preparation_time, :ingredient1, :ingredient2, :ingredient3, :ingredient4, :ingredient5, :ingredient6, :guests, :type_of_diet, :type_of_cuisine, :list_of_ingredients_with_quantity, :@text, :[], :answer)
    end

    def receipt_params
      params.require(:receipt).permit(:content)
    end
  
end
