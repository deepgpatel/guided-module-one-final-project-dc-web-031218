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
       - employed, boolean   - game_id, integer        - console, string
                               (foreign key)

       ## a method should go in the class that it returns when called

       ## use cases:
        - user matching
        - data analysis

        ## user stories:
         - a user can see what games other users own on the console(s) they own
         - a user can see what games people in their age group are playing
         - a game (aka game developer) can produce statistics on its user-base

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

          - db/seeds.rb                                               X
          - rake task that seeds                                      X
          - custom methods: wave 1
          - scavange the star wars
            api lab
          - scavange the cli
            jukebox lab
          -
