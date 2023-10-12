Note: molecule >=6 do some changes respect to molecule 5.1.0.

# Molecule testing

Install molecule:

    pip install molecule==5.1.0

Create a new role with molecule:

    molecule init role myrole

Then test it:

    molecule test

And test it but leave the container running for debugging:

    molecule converge

Set a 'breakpoint' using `fail:` in the tasks.

    - name: Fail here
      fail:
        msg: "Fail here"

Then run the playbook with:

    molecule converge


Login to the container:

    molecule login


Destroy the container:
    
        molecule destroy