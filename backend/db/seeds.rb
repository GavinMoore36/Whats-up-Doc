# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'rest-client'


#Rework to get the rest of the seed data only grabbing around a thousand at a time
def seed_hospital_data
  hospital_data_string = RestClient.get("https://health.data.ny.gov/resource/7xgt-tyms.json")
  hospital_data_hash = JSON.parse(hospital_data_string)
  hospital_data_hash.each do |key|
    Hospital.create(facility_name: key["facility_name"],
      street: key["address1"], city: key["city"], state: key["cooperator_state"],
      county: key["county"], zip: key["fac_zip"].to_i, phone: key['fac_phone'],
      description:key["description"], latitude: key["latitude"], longitude: key["longitude"] )
  end
end
# def seed_hospital_data
#   10.times do |x|
#     Hospital.create(facility_name: "facility_name#{x+1}",
#           street: "address#{x+1}", city: "city#{x+1}", state: "cooperator_state#{x+1}",
#           county: "county#{x+1}", zip: (x+1), phone: ("1231231234"),
#           description:"description#{x+1}", latitude: "latitude#{x+1}", longitude: "longitude#{x+1}")
#   end
# end

def seed_doctor_data
  specialties =
  ['Abdominal Radiology Radiology-Diagnostic',
'Addiction Psychiatry Psychiatry',
'Adolescent Medicine Pediatrics',
'Adult Cardiothoracic Anesthesiology Anesthesiology',
'Adult Reconstructive Orthopaedics Orthopaedic Surgery',
'Advanced Heart Failure & Transplant Cardiology Internal Medicine',
'Allergy & Immunology',
'Anesthesiology',
'Biochemical Genetics Medical Genetics',
'Blood Banking - Transfusion Medicine Pathology-Anatomic & Clinical',
'Cardiothoracic Radiology Radiology-Diagnostic',
'Cardiovascular Disease Internal Medicine',
'Chemical Pathology Pathology-Anatomic & Clinical',
'Child & Adolescent Psychiatry Psychiatry',
'Child Abuse Pediatrics Pediatrics',
'Child Neurology Neurology',
'Clinical & Laboratory Immunology Allergy & Immunology',
'Clinical Cardiac Electrophysiology Internal Medicine',
'Clinical Neurophysiology Neurology',
'Colon & Rectal Surgery',
'Congenital Cardiac Surgery Thoracic Surgery',
'Craniofacial Surgery Plastic Surgery',
'Critical Care Medicine Anesthesiology',
'Critical Care Medicine Internal Medicine',
'Cytopathology Pathology-Anatomic & Clinical',
'Dermatology',
'Dermatopathology Dermatology',
'Developmental-Behavioral Pediatrics Pediatrics',
'Emergency Medicine',
'Endocrinology, Diabetes & Metabolism Internal Medicine',
'Endovascular Surgical Neuroradiology Neurological Surgery',
'Endovascular Surgical Neuroradiology Neurology',
'Endovascular Surgical Neuroradiology Radiology-Diagnostic',
'Family Medicine',
'Family Practice',
'Female Pelvic Medicine & Reconstructive Surgery Obstetrics & Gynecology',
'Foot & Ankle Orthopaedics Orthopaedic Surgery',
'Forensic Pathology Pathology-Anatomic & Clinical',
'Forensic Psychiatry Psychiatry',
'Gastroenterology Internal Medicine',
'Geriatric Medicine Family Medicine',
'Geriatric Medicine Internal Medicine',
'Geriatric Medicine Family Practice',
'Geriatric Psychiatry Psychiatry',
'Hand Surgery Orthopaedic Surgery',
'Hand Surgery Plastic Surgery',
'Hand Surgery Surgery-General',
'Hematology Internal Medicine',
'Hematology Pathology-Anatomic & Clinical',
'Hematology & Oncology Internal Medicine',
'Infectious Disease Internal Medicine',
'Internal Medicine',
'Internal Medicine-Pediatrics',
'Interventional Cardiology Internal Medicine',
'Medical Genetics',
'Medical Microbiology Pathology-Anatomic & Clinical',
'Medical Toxicology Emergency Medicine',
'Medical Toxicology Preventive Medicine',
'Molecular Genetic Pathology Medical Genetics',
'Muscoskeletal Radiology Radiology-Diagnostic',
'Musculoskeletal Oncology Orthopaedic Surgery',
'Neonatal-Perinatal Medicine Pediatrics',
'Nephrology Internal Medicine',
'Neurological Surgery',
'Neurology',
'Neuromuscular Medicine Neurology',
'Neuromuscular Medicine Physical Medicine & Rehabilitation',
'Neuropathology Pathology-Anatomic & Clinical',
'Neuroradiology Radiology-Diagnostic',
'Nuclear Medicine',
'Nuclear Radiology']

doc_images = [
  'https://myblue.bluecrossma.com/sites/g/files/csphws1086/files/inline-images/Doctor%20Image%20Desktop.png',
  'https://hcplive.s3.amazonaws.com/v1_media/_image/happydoctor.jpg',
  'https://ichef.bbci.co.uk/news/660/media/images/76055000/jpg/_76055361_482566485.jpg',
  'http://nationalpainreport.com/wp-content/uploads/2014/07/bigstock-Doctor-physician-Isolated-ov-33908342-e1446160270762.jpg',
  'https://res.cloudinary.com/sagacity/image/upload/c_crop,h_4824,w_3446,x_0,y_0/c_limit,dpr_auto,f_auto,fl_lossy,q_80,w_1080/1017-bayougraphy-doctor-now_ranqxn.jpg',
  'https://www.barbadospocketguide.com/images/stories/health-and-wellbeing/doctors/barbados-doctor.jpg',
  'https://doctorsthatdo.org/wp-content/uploads/2018/01/dr-mike-1.jpg',
  'https://www.indiewire.com/wp-content/uploads/2017/10/147282_4632.jpg?w=780',
  'https://prd-mp-images.azureedge.net/da39631b-5a0e-476e-bf5c-dbaecf316682/image/fd4dd048-ca56-442f-bdad-a8e008a00b81/doctorforworkerscomp.jpg?width=249&height=166',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnwhINYfZgfk0MBoJhidUTdrvAtIiXU8CU-ejvamnis3jfRw1K',
  'https://www.marijuanadoctor.com/wp-content/uploads/2017/12/william-rymer-md.jpg',
  'https://njmonthly.com/wp-content/uploads/cache/2008/01/16006860405_de11619ec9_b/111247368.jpg',
  'https://www.irishtimes.com/polopoly_fs/1.3368495.1516893920!/image/image.jpg_gen/derivatives/box_620_330/image.jpg',
  'https://vignette.wikia.nocookie.net/scrubs/images/d/d5/S6-HQ-Cox.jpg/revision/latest/top-crop/width/320/height/320?cb=20141103192935',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bd/Arthur_Conan_Doyle_by_Walter_Benington%2C_1914.png/220px-Arthur_Conan_Doyle_by_Walter_Benington%2C_1914.png',
  'https://vignette.wikia.nocookie.net/p__/images/0/06/DR-WATSON-dr-john-h-watson-11360730-1920-1080.jpg/revision/latest?cb=20131127185159&path-prefix=protagonist',
  'https://s3-us-west-2.amazonaws.com/melingoimages/Images/93969.jpg',
  'https://www.exac.com/wp-content/uploads/2017/05/patients_find-a-surgeon_doctor.jpg',
  'https://choicespine.com/wp-content/uploads/surgeons-header-2.jpg',
  'http://m3.wyanokecdn.com/98d0838159596b00db27e5fd4bd6f86c.jpg',
  'http://thefederalistpapers.org/wp-content/uploads/2015/07/doctor.jpg',
  'https://d2v9y0dukr6mq2.cloudfront.net/video/thumbnail/FyKJcnp/successful-african-woman-doctor-standing-in-office_4y7jrkmzl__F0000.png',
  'https://img.freepik.com/free-photo/beautiful-young-female-doctor-looking-camera-office_1301-7807.jpg?size=338&ext=jpg',
]

# puts specialties
  1668.times do |x|
# 10.times do |x|
    Doctor.create(name: ("Dr. "+Faker::Name.last_name),
    specialty: "#{specialties.sample}",
    description: 'Many years of school and research in my field has lead me to a life where I feel happy to say I feel assured that I made the right descision spending my career healing people.',
    image: "#{doc_images.sample}",
    hospital_id: ((x/2)+1),
    username: Faker::Internet.username,
    password: '123'
  )
    # byebug
  end
end

def seed_patient_data
  images = [
    'https://i0.wp.com/i.ytimg.com/vi/rDu9oQx9MyU/maxresdefault.jpg',
    'https://pbs.twimg.com/profile_images/1717956431/BP-headshot-fb-profile-photo_400x400.jpg',
    'https://i.kinja-img.com/gawker-media/image/upload/s--Tg_qqR3r--/c_scale,f_auto,fl_progressive,q_80,w_800/dnmtn4ksijwyep0xmljk.jpg',
    'https://secure.gravatar.com/avatar/15fffbb00e75fb2874005e14a2319adb?s=400&d=mm&r=g',
    'https://www.gannett-cdn.com/-mm-/2ef9bde4eed4205f71015259e26e9ad93dc6b4ad/c=81-0-485-539/local/-/media/2017/05/01/JacksonMS/JacksonMS/636292346391795887-gardner.jpg?width=534&height=712&fit=crop',
    'https://www.alvinailey.org/sites/default/files/styles/slideshow_image/public/melanie-person.jpg?itok=ocw3xkx_',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTdqOOt6puvOHioBP8v8HU0QCBT84d13XJshNkBpJq9aoK5SN4A',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQRQWYtBq8q23Q_RQIldfrADDihHMeW-i8cQWY0hu9tWYTP1Hv5',
    'https://businessandfinance.com/wp-content/uploads/2017/12/Gene-Murtagh-Kingspan.jpg',
    'https://fortunedotcom.files.wordpress.com/2016/11/bpoy-larry-fink.jpg?w=820&h=570&crop=1',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDxwvDEZcP88evQhy6ojvXAg3W1uIEK_SI81XO4oMAIevSVxad',
    'https://fortunedotcom.files.wordpress.com/2016/11/30-guibin-zhao.jpg?w=820&h=570&crop=1',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRH8Xk5pRa9rJft5gUwauJMW7ElywLp-BT-lhRW39PPU_ftV1kx',
    'https://i.imgflip.com/1kc8to.jpg',
    'https://cdn.pixabay.com/photo/2017/06/03/04/46/man-2367954_960_720.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQHW58qseLYsCUSr4tdFX-HRT1o28EYpOYY5qm3-Ps0jgsBsnUEgg',
    'https://i2-prod.mirror.co.uk/incoming/article12543645.ece/ALTERNATES/s615/PAY-Koku-Istambulova_3_Luiza-Tsagueva_east2west.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFiVqmePcEms0n3fh500wbnqxBu80RbbFmsCFBkTbON2KXrlyd',
    'https://s.yimg.com/ny/api/res/1.2/zO2O20S3gPE3AB7W805T2Q--~A/YXBwaWQ9aGlnaGxhbmRlcjtzbT0xO3c9MTI4MDtoPTk2MDtpbD1wbGFuZQ--/https://65.media.tumblr.com/150b3ac85020eed0bce5ae1774cee4d7/tumblr_inline_ofeksd2ZjX1utbiue_1280.png.cf.jpg',
    'http://timedotcom.files.wordpress.com/2018/04/time-100-mauricio-macri.jpg?quality=85&crop=256px%2C0px%2C1628px%2C1628px&resize=600%2C600&strip&zoom=2',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSt-YtFuES0mhABwY3uKxp4-SRiC3P3VR-Qx3vC0wS2pnhHb1LU',
    'https://www.kevinmd.com/blog/wp-content/uploads/shutterstock_114189103.jpg',
    'https://www.rd.com/wp-content/uploads/2017/07/01-Things-You-Should-NEVER-Do-When-Visiting-Someone-in-the-Hospital-1024x683.jpg',
    'http://media.mlive.com/health_impact/photo/9397278-large.jpg',
    'http://s3.india.com/wp-content/uploads/2014/12/krishna-murthy.jpg',
    'https://english.cdn.zeenews.com/sites/default/files/2017/11/17/639329-indian-men.jpg',
    'https://littleindia.com/wp-content/themes/grandnews-child/files/sept07/kaimal_1.jpg',
    'https://cdn.theatlantic.com/assets/media/img/nj/2016/1/26/asian-americans-feel-held/jason-shen-headshot.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFMDZ3c-49HsEgkOeATEqekCukiaisRvMFV6fzFtVk76q168T5',
    'https://img.huffingtonpost.com/asset/5a8595451e00002c007abcb9.jpeg?ops=scalefit_600_noupscale',
    'https://cp.peoplemedia.com/site/general/pm1897/images/nm1.jpg',
    'https://is5-ssl.mzstatic.com/image/thumb/Music118/v4/b2/9d/97/b29d9754-a8ac-da55-7237-a7e36eedf7d8/source/1200x630bb.jpg',
    'https://cdn.theatlantic.com/assets/media/img/mt/2016/09/RTX1GZCO/lead_720_405.jpg?mod=1533691850',
    'https://www.wthr.com/sites/default/files/styles/article_image/public/2019/03/04/hillaryclintonjan2019ap970.jpg?itok=xBIpNSNF',
    'https://www.dailywire.com/sites/default/files/styles/article_full/public/uploads/2019/03/bernie_sanders.jpg?itok=GOCn30aP',
    'https://www.telegraph.co.uk/content/dam/tv/2018/09/04/TELEMMGLPICT000172374237_trans_NvBQzQNjv4Bqek9vKm18v_rkIPH9w2GMNtm3NAjPW-2_OvjCiS6COCU.jpeg?imwidth=450',
    'https://apps.carleton.edu/stock/ldapimage.php?id=zhaidar&source=campus_directory',
    'https://apps.carleton.edu/reason_package/reason_4.0/www/images_local/1507088.jpg',
    'http://southsudanlebanon.org/files/pictures/1491070693_1489830740nehmekhawliconsularcoprs.jpg',
    'https://i.dailymail.co.uk/i/pix/2018/02/01/13/48CAA1BA00000578-5339973-image-m-244_1517490742622.jpg'
  ]
  1668.times do |x|
  # 5.times do |x|
    Patient.create(first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      description: "I am terminally ill and don't know what to do. Help me",
      image: "#{images.sample}",
      username: Faker::Internet.username,
      password: '123')
  end
end
# Faker::LoremFlickr.image("400x200", ['person'])

def seed_visit_data
  ailments = ["Abdominal aortic aneurysm", "Acne", "Acute cholecystitis", "Acute lymphoblastic leukaemia", "Acute myeloid leukaemia", "Acute pancreatitis",
"Addisons disease", "Alcohol misuse", "Alcohol poisoning", "Alcohol-related liver disease", "Allergic rhinitis", "Allergies", "Alzheimers disease",
"Anal cancer", "Anaphylaxis", "Angioedema", "Ankylosing spondylitis", "Anorexia nervosa", "Anxiety", "Appendicitis",
"Arthritis", "Asbestosis", "Asthma", "Atopic eczema", "Attention deficit hyperactivity disorder (ADHD)", "Autistic spectrum disorder (ASD)", "Bacterial vaginosis", "Benign prostate enlargement",
"Bile duct cancer (cholangiocarcinoma)", "Binge eating", "Bipolar disorder", "Bladder cancer", "Blood poisoning (sepsis)", "Bone cancer", "Bowel cancer", "Bowel incontinence",
"Bowel polyps", "Brain stem death", "Brain tumours", "Breast cancer", "Bronchiectasis", "Bronchitis", "Bulimia", "Bunion", "Bursitis",
"Carcinoid syndrome and carcinoid tumours", "Catarrh", "Cellulitis", "Cervical cancer", "Chest infection", "Chest pain", "Chickenpox", "Chilblains",
"Chronic fatigue syndrome", "Chronic kidney disease", "Chronic lymphocytic leukaemia", "Chronic myeloid leukaemia", "Chronic obstructive pulmonary disease", "Chronic pancreatitis", "Cirrhosis",
"Clostridium difficile", "Coeliac disease", "Cold sore", "Coma", "Common cold", "Common heart conditions", "Congenital heart disease", "Conjunctivitis",
"Constipation", "Costochondritis", "Cough", "Crohns disease", "Croup", "Cystic fibrosis", "Cystitis", "Deafblindness",
"Deep vein thrombosis", "Dehydration", "Dementia", "Dementia with Lewy bodies", "Dental abscess", "Depression", "Dermatitis herpetiformis",
"Diabetes", "Diabetic retinopathy", "Diarrhoea", "Discoid eczema", "Diverticular disease and diverticulitis", "Dizziness (Lightheadedness)", "Downs syndrome",
"Dry mouth", "Dysphagia (swallowing problems)", "Dystonia", "Earache", "Earwax build-up", "Ebola virus disease", "Ectopic pregnancy",
"Endometriosis", "Epilepsy", "Erectile dysfunction (impotence)", "Escherichia coli", "Ewing sarcoma", "Eye cancer", "Febrile seizures", "Fever",
"Fibroids", "Fibromyalgia", "Flatulence", "Flu", "Foetal alcohol syndrome", "Food poisoning", "Fungal nail infection", "Gallbladder cancer", "Gallstones",
"Ganglion cyst", "Gastroenteritis", "Gastro-oesophageal reflux disease (GORD)", "Genital herpes", "Genital warts", "Germ cell tumours", "Glandular fever",
"Gout", "Gum disease", "Haemorrhoids (piles)", "Hairy cell leukaemia", "Hand, foot and mouth disease", "Hay fever", "Head and neck cancer", "Head lice and nits",
"Headaches", "Hearing loss", "Heart failure", "Hepatitis A", "Hepatitis B", "Hepatitis C", "Hiatus hernia", "High cholesterol",
"HIV", "Hodgkin lymphoma", "Huntingtons disease", "Hyperglycaemia (high blood sugar)", "Hyperhidrosis", "Hypoglycaemia (low blood sugar)", "Idiopathic pulmonary fibrosis", "Impetigo",
"Indigestion", "Ingrown toenail", "Inherited heart conditions", "Insomnia", "Iron deficiency anaemia", "Irritable bowel syndrome (IBS)", "Irritable hip", "Itching",
"Itchy bottom Kaposis sarcoma", "Kidney cancer", "Kidney infection", "Kidney stones Labyrinthitis", "Lactose intolerance", "Langerhans cell histiocytosis", "Laryngeal (larynx) cancer", "Laryngitis", "Leg cramps",
"Lichen planus", "Liver cancer", "Liver disease", "Liver tumours", "Loss of libido", "Lung cancer", "Lupus", "Lyme disease", "Lymphoedema", "Malaria", "Malignant brain tumour (cancerous)", "Malnutrition", "Measles", "Meningitis", "Menopause", "Mesothelioma",
"Middle ear infection (otitis media)", "Migraine", "Miscarriage", "Motor neurone disease (MND)", "Mouth cancer", "Mouth ulcer", "Multiple myeloma", "Multiple sclerosis (MS)",
"Mumps", "Menieres disease", "Nasal and sinus cancer", "Nasopharyngeal cancer", "Neuroblastoma", "Neuroendocrine tumours", "New or worsening back pain", "Non-alcoholic fatty liver disease (NAFLD)", "Non-Hodgkin lymphoma",
"Norovirus", "Nosebleed", "Obesity", "Obsessive compulsive disorder (OCD)", "Obstructive sleep apnoea", "Oesophageal cancer", "Osteoarthritis", "Osteoporosis", "Osteosarcoma",
"Otitis externa", "Ovarian cancer", "Ovarian cyst", "Overactive thyroid", "Pagets disease of the nipple", "Pancreatic cancer", "Panic disorder", "Parkinsons disease", "Pelvic organ prolapse",
"Penile cancer", "Peripheral neuropathy", "Personality disorder", "Pleurisy", "Pneumonia", "Polymyalgia rheumatica", "Post-traumatic stress disorder (PTSD)", "Postnatal depression",
"Pregnancy", "Pressure ulcers", "Prostate cancer", "Psoriasis", "Psoriatic arthritis", "Psychosis Rare tumours", "Raynauds phenomenon", "Reactive arthritis", "Restless legs syndrome",
"Retinoblastoma", "Rhabdomyosarcoma", "Rheumatoid arthritis", "Ringworm and other fungal infections", "Rosacea", "Scabies", "Scarlet fever", "Schizophrenia",
"Scoliosis", "Septic shock Sexually transmitted infections (STIs)", "Shingles", "Shortness of breath", "Sickle cell disease", "Sinusitis", "Sjogrens syndrome", "Skin cancer (melanoma)", "Skin cancer (non-melanoma)",
"Slapped cheek syndrome", "Soft tissue sarcomas", "Sore throat", "Spleen problems and spleen removal", "Stillbirth", "Stomach ache and abdominal pain", "Stomach cancer", "Stomach ulcer",
"Stress, anxiety and low mood", "Stroke", "Sudden infant death syndrome (SIDS)", "Sunburn", "Swollen glands", "Testicular cancer", "Testicular lumps and swellings", "Thirst", "Threadworms",
"Thyroid cancer", "Tinnitus", "Tonsillitis", "Tooth decay", "Toothache", "Transient ischaemic attack (TIA)", "Trigeminal neuralgia", "Tuberculosis (TB)", "Type 1 diabetes", "Type 2 diabetes",
"Ulcerative colitis", "Underactive thyroid", "Urinary incontinence", "Urinary tract infection (UTI)", "Urticaria (hives)", "Vaginal cancer", "Vaginal thrush", "Varicose eczema", "Varicose veins", "Venous leg ulcer",
"Vertigo", "Vitamin B12 or folate deficiency anaemia", "Vomiting", "Vulval cancer", "Warts and verrucas", "Whooping cough Wilms tumour", "Womb (uterus) cancer"]

  3336.times do |x|
  # 9.times do |x|
    Visit.create(ailment: ailments.sample, description: "There ailment was treated and they should take it easy for a little while.", doctor_id: ((x/2)+1), patient_id: ((x/2)+1))
  end
end
#
# def seed_chat_data
#   # 15544.times do |x|
#   9.times do |x|
#     Chat.create(message: "this is a test so hopefully it works", doctor_id: ((x/2)+1), patient_id: ((x/2)+1))
#   end
# end

seed_hospital_data
seed_patient_data
seed_doctor_data
seed_visit_data
# seed_chat_data




# rails db:reset
