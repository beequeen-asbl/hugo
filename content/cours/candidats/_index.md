---
title: Candidats
description: Etre recontacté avant la prochaine session de cours
layout: main
css: page_centree
---

<form action="https://beequeen.be/rucher.ecole/newCandidat2.php" method="post">
<label for="Pre"><b>Prénom</b></label><br>
<input id="Pre" name="pre" required pattern".+" /><br>
<label for="Nom"><b>Nom</b></label><br>
<input id="Nom" name="nom" required pattern=".+" /><br>
<label for="email"><b>e-mail</b></label><br>
<input type="email" id="mail" name="mail" required pattern=".+@.+\..+"><br>
<label for="Gsm"><b>Gsm</b> (p.ex.: 0495 12 34 56)</label><br>
<input id="Gsm" name="gsm" pattern="[0-9]{4} [0-9]{2} [0-9]{2} [0-9]{2}" /><br>
<label for="CodPost"><b>Code postal</b></label><br>
<input id="CodPost" name="cod" pattern="[0-9]{4}" /><br>
<label for="Loc"><b>Localité</b></label><br>
<input id="Loc" name="loc" /><br>
<label for="Adr"><b>Adresse</b></label><br>
<input id="Adr" name="addr" /><br>
<br>
<button>S'inscrire</button>
</form>
