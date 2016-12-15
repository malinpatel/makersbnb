require 'spec_helper'

feature "viewing requests" do
  include Helpers

  let(:user) do
    {first_name: "Malin",
      last_name: "Patel",
      username: "malina",
      email: "malina@gmail.com",
      password: "gugu123"}
    end

    let(:user2) do
      {first_name: "Pea",
        last_name: "Crystal",
        username: "pea",
        email: "pea@gmail.com",
        password: "secret"}
      end


      let(:penthouse) do
        {name: "London Penthouse",
          description: "Lovely big city flat in Whitechapel E1",
          price: 100,
          start_date: '2016-01-01',
          end_date: '2018-01-01',
          capacity: '4'}
        end

      let(:hovel) do
        {name: "Baldrick's Hovel",
          description: "A hole located in Bethnal Green",
          price: 10,
          start_date: '2016-01-01',
          end_date: '2018-01-01',
          capacity: '4'}
        end

          before(:each) do
            sign_up(user)
            list_property(penthouse)
            log_out
            sign_up(user2)
            make_request(Space.first)
          end

      scenario "View requests I have made" do
        visit '/requests/view'
        within "div#requests-made" do
          expect(page).to have_content "Requests I have made"
          expect(page).to have_content penthouse[:name]
          expect(page).to have_content "2017-01-01"
        end
        click_link '2017-01-01'
        expect(page).to have_content "Request for London Penthouse"
        expect(page).to have_content "On date: 2017-01-01"
        expect(page).to have_content "Status: pending"
        expect(page).to have_content "For: 4 Guests"
        expect(page).to have_content "Owned by malina"
      end

      scenario "View requests on my properties that I have received" do
        log_out
        log_in user
        visit '/requests/view'
        within 'div#requests-received' do
          expect(page).to have_content "Requests I have received"
          expect(page).to have_content penthouse[:name]
          expect(page).to have_content "Request from"
          expect(page).to have_content user2[:username]
        end
      end

      scenario "I cannot view requests while not logged in" do
        log_out
        visit '/requests/view'
        expect(current_path).to eq('/sessions/new')
        message = "You have to be logged in to view the requests"
        expect(page).to have_content(message)
      end
    end
