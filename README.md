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

       ## use cases:
        - user matching
        - data analysis

        ## user stories:
         - a user can see what games other users own on the console(s) they own
         - a user can see what games people in their age group are playing
         - a game (aka game developer) can produce statistics on its user-base

**ALERT: to run program, (1) execute command "rake db:migrate && rake db:seed" from parent directory, and (2) execute "ruby bin/run.rb" from parent directory.**
