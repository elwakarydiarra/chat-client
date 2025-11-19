CREATE TABLE utilisateurs (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(100),
    prenom VARCHAR(100),
    email VARCHAR(150) UNIQUE NOT NULL,
    mot_de_passe_hash TEXT NOT NULL,
    date_naissance DATE,
    adresse TEXT,
    langue VARCHAR(10),
    pays VARCHAR(50)
);

CREATE TABLE agences (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(100),
    adresse TEXT,
    ville VARCHAR(100),
    pays VARCHAR(100)
);

CREATE TABLE vehicules (
    id SERIAL PRIMARY KEY,
    marque VARCHAR(100),
    modele VARCHAR(100),
    immatriculation VARCHAR(50) UNIQUE,
    categorie_acriss VARCHAR(4),
    disponibilite BOOLEAN DEFAULT TRUE,
    prix_par_jour DECIMAL(10, 2)
);

CREATE TABLE reservations (
    id SERIAL PRIMARY KEY,
    utilisateur_id INTEGER REFERENCES utilisateurs(id),
    vehicule_id INTEGER REFERENCES vehicules(id),
    agence_depart_id INTEGER REFERENCES agences(id),
    agence_retour_id INTEGER REFERENCES agences(id),
    date_heure_depart TIMESTAMP,
    date_heure_retour TIMESTAMP,
    montant_total DECIMAL(10, 2),
    statut VARCHAR(20) DEFAULT 'confirmée',

);

CREATE TABLE offres (
    id SERIAL PRIMARY KEY,
    description TEXT,
    remise DECIMAL(5, 2),
    date_debut TIMESTAMP,
    date_fin TIMESTAMP
);

CREATE TABLE paiements (
    id SERIAL PRIMARY KEY,
    reservation_id INTEGER REFERENCES reservations(id),
    montant DECIMAL(10, 2),
    statut VARCHAR(20),
    date_paiement TIMESTAMP,
    transaction_id VARCHAR(100)
);

CREATE TABLE factures (
    id SERIAL PRIMARY KEY,
    reservation_id INTEGER REFERENCES reservations(id),
    montant DECIMAL(10, 2),
    date_emission TIMESTAMP
);

CREATE TABLE support_messages (
    id SERIAL PRIMARY KEY,
    utilisateur_id INTEGER REFERENCES utilisateurs(id),
    type VARCHAR(20),
    contenu TEXT,
    date_envoi TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    statut VARCHAR(20) DEFAULT 'reçu'
);
