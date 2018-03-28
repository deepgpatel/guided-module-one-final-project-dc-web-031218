                          ### simple and cool ###

                    ### subject ###   |   ### model ###
                    - video games         - user/game/game_user

       ____________         _________________         ____________
       |##########|       / |###############| \       |##########|
       |## user ##| ===== - |## game_user ##| - ===== |## game ##|
       |##########|       \ |###############| /       |##########|

       - id, integer         - id, integer             - id, integer
         (auto-generated)      (auto-generated)          (auto-generated)
       - name, string        - user_id, integer        - title, string
       - age, integer          (foreign key)           - genre, string
       - employed, boolean   - game_id, integer
                               (foreign key)

       ## a method should go in the class that it returns when called

       ## use cases:
        - user matching
        - data analysis

        ## user stories:
         -
         -
         -

         ## produce git branch
          - git checkout -b <branch>
         ## change current branch
          - git checkout <branch>
         ## merge
          - push to github
          - produce pull request to master


       _____________________________________________________________________
       |                             |               |           |         |
       |         todo_name           | in_progress?  | testing?  |  done?  |
       |_____________________________|_______________|___________|_________|

          - db/seeds.rb
          - rake task that seeds
          - scavange the star wars
            api lab
          - scavange the cli
            jukebox lab
