bradmin:
  user.present:
    - fullname: Brad
    - groups:
      - sudo

pi:
  user.present:
    - fullname: Raspberry Pi
    - groups:
      - sudo
    - password: '$6$SALTsalt$EjbwQapDco/bCP/APm4274rdTX3oq2q5O0Wt7iRzpdBm0BE/oqWNpG8EzMnKtsYV/4szY868xEM2F1LAxD.bE/'
