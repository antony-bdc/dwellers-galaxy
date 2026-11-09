# mods

Put the modpack's `.jar` files here. They are mounted read-only and synced into the server on every start
(`REMOVE_OLD_MODS=true` removes jars that are no longer in this folder).

The jars themselves are not committed (see `.gitignore`) because mod licenses usually don't allow redistribution.
Keep a list in `mods.txt` instead, so the pack can be rebuilt.
