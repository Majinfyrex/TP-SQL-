-- 1 listez les articles dans l'ordre alphabétique des désignation
SELECT *
FROM article
ORDER BY designation ASC;

-- 2 listez les artciles dans l'ordre des prix du plus élévé au moins élévé
SELECT *
FROM article
ORDER BY prix DESC;

--3 lister tous les articles qui sont des "boulons" et triez les résultats par ordre de prix ascendant
SELECT *
FROM article
WHERE designation like 'Boulon%'
ORDER BY prix ASC;

-- 4 Listez tous les articles dont la désignation contient le mot "sachet"
SELECT *
FROM article
WHERE designation LIKE '%sachet%';

-- 5 Listez tous les articles dont la désignation contient le mot "sachet"
SELECT *
FROM article
WHERE LOWER(designation) like '%sachet%'

-- 6 Listez les articles avec les informations fournisseur correspondantes.
-- Les résultats doivent être triées dans l’ordre alphabétique des fournisseurs et par article du prix le plus élevé au moins élevé.
SELECT *
FROM article, fournisseur
WHERE article.ID_FOU=fournisseur.ID
ORDER BY fournisseur.NOM ASC, article.PRIX DESC;

-- 7 Listez les articles de la société "Dubois & Fils"
SELECT *
FROM article, fournisseur
WHERE article.ID_FOU=fournisseur.ID AND fournisseur.NOM='Dubois & Fils';

-- 8 Calculez la moyenne des prix des articles de la société "Dubois & Fils"
SELECT AVG(prix)
FROM article, fournisseur
WHERE article.ID_FOU=fournisseur.ID AND fournisseur.NOM='Dubois & Fils'


-- 9 Calculez la moyenne des prix des articles de chaque fournisseur
SELECT fournisseur.nom, AVG(prix)
FROM article, fournisseur
WHERE article.ID_FOU=fournisseur.ID
GROUP BY fournisseur.nom;

-- 10 Sélectionnez tous les bons de commandes émis entre le 01/03/2019 et le 05/04/2019 à 12h00
SELECT *
FROM bon
WHERE date_cmde BETWEEN '2019-03-01' AND '2019-04-05 12:00:00';

-- 11 Sélectionnez les divers bons de commande qui contiennent des boulons
SELECT article.designation
FROM bon, compo, article
WHERE bon.ID=compo.ID_BON AND compo.ID_ART=article.ID
AND designation like 'Boulon%';


-- 12 Sélectionnez les divers bons de commande qui contiennent des boulons avec le nom du fournisseur associé
SELECT f.nom, a.designation
FROM bon b, article a, fournisseur f
WHERE b.id_fou = f.id AND f.id = a.id_fou AND a.designation LIKE '%boulon%'

-- 13 Calculez le prix total de chaque bon de commande
-- Requête avec uniquement les bons de commandes ayant au moins un article
select id_bon, sum(qte*prix)
from bon, compo, article
where bon.ID=compo.ID_BON and compo.ID_ART=article.ID
GROUP BY id_bon;

-- 14 Comptez le nombre d’articles de chaque bon de commande
SELECT id_bon, sum(qte)
FROM bon, compo, article
WHERE bon.ID=compo.ID_BON AND compo.ID_ART=article.ID
GROUP BY id_bon;

-- 15 Affichez les numéros de bons de commande qui contiennent plus de 25 articles et affichez le nombre d’articles de chacun de ces bons de commande
SELECT id_bon, SUM(qte)
FROM bon, compo, article
WHERE bon.ID=compo.ID_BON AND compo.ID_ART=article.ID
GROUP BY id_bon
HAVING SUM(qte)>25;

-- 16 Calculez le coût total des commandes effectuées sur le mois d’avril
SELECT sum(qte*prix)
FROM bon, compo, article
WHERE bon.ID=compo.ID_BON and compo.ID_ART=article.ID
AND month(date_cmde)=4;

