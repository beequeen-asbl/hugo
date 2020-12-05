---
title: Candidats
description: Etre recontacté avant la prochaine session de cours
layout: main
css: page_centree
---

<form action="https://beequeen.be/rucher.ecole/newCandidat.php" method="post">
<label for="Pre">Prénom</label><br>
<input id="Pre" name="pre" required pattern".+" /><br>
<label for=Nom">Nom</label><br>
<input id="Nom" name="nom" required pattern=".+" /><br>
<label for="email">e-mail</label><br>
<input type="email" id="mail" name="mail" required pattern=".+@.+\..+"><br><br>
<button>S'inscrire</button>
</form>
