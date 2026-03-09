# R/data.R  — Single source of truth for all portfolio content
# Links sourced from: resume PDF, Google Sites (public-health & data-science tabs),
# LinkedIn (main, cert, edu, projects PDFs), DOI records, PubMed, Google Scholar

# ── SOCIAL LINKS ────────────────────────────────────────────────────────────
links <- list(
  linkedin    = "https://www.linkedin.com/in/drmrahman/",
  github      = "https://github.com/mahm00d27",
  scholar     = "https://scholar.google.com/citations?user=EuKI7bAAAAAJ&hl=en",
  orcid       = "https://orcid.org/0000-0003-1586-1324",
  researchgate= "https://www.researchgate.net/profile/Mahmoodur-Rahman",
  pubmed      = "https://www.ncbi.nlm.nih.gov/myncbi/1ZG9s8OACEqA8/bibliography/public/",
  twitter     = "https://twitter.com/mahm00d27",
  bluesky     = "https://bsky.app/profile/mahm00d27.bsky.social",
  gscholar_ubc= "https://datascienceandhealth.ubc.ca/people/mahmoodur-rahman",
  portfolio   = "https://sites.google.com/view/rmahmood",
  email       = "mahmoodnnb@gmail.com",
  email_work  = "mahmoodur.rahman@phsa.ca"
)

# ── EXPERIENCE ──────────────────────────────────────────────────────────────
experience <- list(
  list(
    period   = "Sep 2023 – Present",
    role     = "Business Analyst, Data and Analytics",
    org      = "Stroke Services BC · PHSA",
    location = "Vancouver, BC",
    link     = "http://www.phsa.ca/our-services/programs-services/stroke-services-bc",
    current  = TRUE,
    bullets  = c(
      "Led transformation of a SAS-based data science workflow into a reproducible, modular, version-controlled R-based workflow within an Azure virtual machine (PANDA platform), leveraging the Microsoft 365 ecosystem and Posit Workbench.",
      "Developed and standardized methodologies to calculate stroke indicators; engaged with Heart & Stroke Foundation, CorHealth, CIHI, and provincial working-groups.",
      "Built an R Shiny dashboard to dynamically present Provincial Stroke Registry data (Endovascular Thrombectomy); contributed to a Power BI dashboard.",
      "Analyzed DAD and NACRS administrative datasets; computed Risk-Adjusted Mortality Rate and other standardized performance metrics.",
      "Presented findings to health authorities, BC Ministry of Health, software engineers, researchers, and academic partners."
    )
  ),
  list(
    period   = "Jul 2022 – Sep 2023",
    role     = "Lead, Research and Knowledge Translation",
    org      = "Provincial Infection Control Network (PICNet) · PHSA",
    location = "Vancouver, BC",
    link     = NULL,
    current  = FALSE,
    bullets  = c(
      "Co-led revision and update of the Provincial Medical Devices Reprocessing SOP, working closely with IPAC experts, the Provincial Reprocessing Working Group, and BC MoH.",
      "Built R Shiny dashboards visualizing provincial HAI incidence (CDI, CPO, MRSA) across health authorities, replacing static PDF reports.",
      "Developed an R Shiny app for real-time child ED visits with VRI symptoms — live SQL data from PHSA's PANDA Azure platform, stratified by surveillance seasons, epi-weeks, health authorities, facilities, and age groups."
    )
  ),
  list(
    period   = "Apr – Jul 2022",
    role     = "Capstone Project — MDS",
    org      = "University of British Columbia",
    location = "Vancouver, BC",
    link     = NULL,
    current  = FALSE,
    bullets  = c(
      "Built an interactive R Shiny dashboard visualizing temporal trends in BC chronic disease incidence (CDR). Client: Office of the Provincial Health Officer & BC Ministry of Health.",
      "Compared Bayesian INLA (Gamma GLM smoothing), Joinpoint regression, and naïve mean-based models for temporal trend analysis.",
      "Tech: R, R Shiny, GIS (Leaflet), Bash, Java, GitHub. Team: Jessie Wong, Jennifer Hoang, Shengting Yan, Daniel Chen (mentor)."
    )
  ),
  list(
    period   = "Dec 2019 – Jun 2022",
    role     = "Research Investigator (Co-Investigator)",
    org      = "Maternal & Child Health Division · icddr,b",
    location = "Dhaka, Bangladesh",
    link     = "https://www.icddrb.org/",
    current  = FALSE,
    bullets  = c(
      "Led nationwide health facility readiness survey using WHO SARA framework: questionnaire design, sampling, data collection, analysis, reporting, and stakeholder engagement.",
      "Developed automated R-based interactive HTML reports for USAID and Save the Children, replacing static Stata/Word reports.",
      "Led Quality of Care assessments for maternal, child, adolescent, and newborn health services across health facilities, in collaboration with UNICEF."
    )
  ),
  list(
    period   = "Jan 2018 – Nov 2019",
    role     = "Study Physician",
    org      = "Maternal & Child Health Division · icddr,b",
    location = "Dhaka, Bangladesh",
    link     = "https://www.icddrb.org/",
    current  = FALSE,
    bullets  = c(
      "Study design, REDCap data management, statistical analysis (Stata, Excel), quality assurance, and manuscript preparation.",
      "Collaborated with Harvard Medical School and Johns Hopkins Bloomberg School of Public Health on Gates Foundation-funded research."
    )
  ),
  list(
    period   = "Aug 2017 – Dec 2017",
    role     = "Clinical Fellow — Pediatrics",
    org      = "Dhaka Hospital · icddr,b",
    location = "Dhaka, Bangladesh",
    link     = "https://www.icddrb.org/hospitals",
    current  = FALSE,
    bullets  = c("Clinical residency in pediatrics and neonatal health.")
  ),
  list(
    period   = "Mar 2015 – Dec 2016",
    role     = "Study Physician & Project Research Physician",
    org      = "Maternal & Child Health Division · icddr,b",
    location = "Dhaka, Bangladesh",
    link     = "https://www.icddrb.org/",
    current  = FALSE,
    bullets  = c(
      "Contributed to development of a low-cost jaundice ruler (icterometer) for neonatal hyperbilirubinemia screening; Gates Foundation / Saving Lives at Birth, led by Dr. Anne CC Lee (Harvard).",
      "Supported NIH R01-funded cluster-RCT on maternal genitourinary infections (MIST trial), led by Prof. Abdullah H Baqui (JHU).",
      "Contributed to AMANHI multi-country study on gestational age biometrics (Bangladesh, Pakistan, Pemba-Tanzania), led by Dr. Blair J Wylie."
    )
  )
)

# ── PUBLIC HEALTH PROJECTS ───────────────────────────────────────────────────
ph_projects <- list(
  list(
    title  = "Stroke Indicators Analysis & Reporting",
    org    = "Stroke Services BC · PHSA",
    period = "2023–Present",
    desc   = "Version-controlled reproducible R workflow within PANDA (Azure VM) to analyze and report stroke indicators. Standardized methodologies with Heart & Stroke Foundation, CorHealth, CIHI, and provincial stroke working-groups.",
    tags   = c("R", "Azure", "Posit Workbench", "R Shiny", "Stroke", "KPIs"),
    link   = "http://www.phsa.ca/our-services/programs-services/stroke-services-bc"
  ),
  list(
    title  = "Provincial Medical Devices Reprocessing Guidelines",
    org    = "PICNet · PHSA",
    period = "2022–2023",
    desc   = "Critical appraisal and literature searches to review evidence and update the BC provincial guidelines on Medical Devices Reprocessing, with IPAC experts, Provincial Reprocessing Working Group, and BC MoH.",
    tags   = c("Evidence Synthesis", "Guidelines", "IPAC", "BC MoH"),
    link   = NULL
  ),
  list(
    title  = "Licensing Status & MNH Readiness of Private Facilities",
    org    = "icddr,b",
    period = "2019–2022",
    desc   = "Assessed licensing practices and structural readiness of private health facilities for maternal, neonatal, and child health services in Bangladesh; identified regulatory gaps and barriers.",
    tags   = c("Health Systems", "QoC", "Bangladesh", "WHO SARA"),
    link   = "https://sites.google.com/view/rmahmood/public-health"
  ),
  list(
    title  = "MaMoni MNCSP Programme Evaluation",
    org    = "icddr,b / USAID",
    period = "2018–2022",
    desc   = "Monitored progress and evaluated impact of USAID-funded MaMoni MNCSP programme strengthening public-sector maternal and newborn care services across Bangladesh.",
    tags   = c("USAID", "Maternal Health", "M&E", "Bangladesh"),
    link   = "https://sites.google.com/view/rmahmood/public-health"
  ),
  list(
    title  = "Multi-Country Newborn Inpatient Care Situation Analysis",
    org    = "icddr,b / UNICEF",
    period = "2018–2019",
    desc   = "Assessed service readiness and quality of care for sick newborns (0–59 days) across seven countries: Bangladesh, Ghana, Nepal, Pakistan, Rwanda, Tanzania, Uganda.",
    tags   = c("Multi-country", "QoC", "Neonatal", "UNICEF"),
    link   = "https://sites.google.com/view/rmahmood/public-health"
  ),
  list(
    title  = "Jaundice Ruler & mCNC App — Saving Lives at Birth",
    org    = "icddr,b / Harvard Medical School",
    period = "2015–2017",
    desc   = "Developed simplified algorithm, mobile app (mCNC), and low-cost icterometer for community-based neonatal jaundice screening. Led by Dr. Anne CC Lee, funded by Gates Foundation.",
    tags   = c("mHealth", "Neonatal", "Gates Foundation", "Harvard", "Icterometer"),
    link   = "https://pubmed.ncbi.nlm.nih.gov/30936236/"
  ),
  list(
    title  = "MIST Trial — Genitourinary Infections & Birth Outcomes",
    org    = "icddr,b / Johns Hopkins / NIH",
    period = "2014–2019",
    desc   = "Community-based cluster-RCT evaluating screening and treatment of maternal BV and UTI on preterm birth and neonatal infection, NIH-funded, led by Prof. Abdullah H Baqui.",
    tags   = c("RCT", "NIH", "Johns Hopkins", "Maternal Health", "Cluster-RCT"),
    link   = "https://doi.org/10.1016/S2214-109X(18)30441-8"
  ),
  list(
    title  = "AMANHI — Maternal & Newborn Health Cohort Harmonization",
    org    = "icddr,b / WHO (8 Countries)",
    period = "2014–2022",
    desc   = "Multi-country cohort harmonization study across 8 countries (Bangladesh, DRC, Ghana, India, Kenya, Pakistan, Tanzania, Zambia) testing biological markers as predictors of maternal and fetal outcomes.",
    tags   = c("Multi-country", "Cohort Study", "WHO", "Sub-Saharan Africa", "South Asia"),
    link   = "https://doi.org/10.7189/jogh.12.04011"
  ),
  list(
    title  = "PCV Effectiveness — Sylhet, Bangladesh",
    org    = "icddr,b / Gates Foundation / GlaxoSmithKline",
    period = "2014–2017",
    desc   = "Evaluated effectiveness of 10-valent pneumococcal conjugate vaccine against invasive disease using incidence trend and case-control study designs; measured impact on clinical pneumonia and carriage.",
    tags   = c("Vaccine", "PCV", "Case-Control", "Gates Foundation"),
    link   = "https://sites.google.com/view/rmahmood/public-health"
  ),
  list(
    title  = "VAMMI — Vaginal Microbiota & Mucosal-Neonatal Inflammation",
    org    = "icddr,b / Brigham & Women's Hospital",
    period = "2014–2017",
    desc   = "Sub-study of MIST funded by Brigham and Women's Hospital. Biobank collection of additional specimens for future testing. Executed by ProjAHNMo consortium.",
    tags   = c("Microbiome", "Biobank", "Harvard", "Brigham & Women's"),
    link   = NULL
  )
)

# ── DATA SCIENCE PROJECTS ────────────────────────────────────────────────────
ds_projects <- list(
  list(
    title  = "BC Chronic Disease Registry Dashboard",
    org    = "UBC MDS Capstone · BC Office of the Provincial Health Officer",
    period = "2022",
    desc   = "Interactive R Shiny dashboard for temporal trends in BC chronic disease incidence. Compared Bayesian INLA, Joinpoint regression, and naïve models. Team: Jessie Wong, Jennifer Hoang, Shengting Yan, Daniel Chen (mentor).",
    tags   = c("R Shiny", "Bayesian", "INLA", "Leaflet", "GIS", "Joinpoint"),
    link   = NULL
  ),
  list(
    title  = "HAI Provincial Surveillance Dashboard",
    org    = "PICNet · PHSA",
    period = "2022–2023",
    desc   = "R Shiny dashboard for in-house KPI visualization of CDI, CPO, and MRSA incidence across BC health authorities, replacing static quarterly PDF surveillance reports.",
    tags   = c("R Shiny", "HAI", "Surveillance", "PHSA"),
    link   = NULL
  ),
  list(
    title  = "Child VRI Emergency Department Dashboard",
    org    = "PICNet · PHSA (PANDA Platform)",
    period = "2022–2023",
    desc   = "R Shiny app with real-time Azure SQL data extraction for child ED visits with suspected VRI, stratified by surveillance seasons, epi-weeks, health authorities, facilities, and age groups.",
    tags   = c("R Shiny", "Azure", "SQL", "Real-time", "VRI"),
    link   = NULL
  ),
  list(
    title  = "COVID-19 Dashboard — Bangladesh & Comparators",
    org    = "Independent Project",
    period = "2020–2021",
    desc   = "Interactive dashboard visualizing COVID-19 cases, deaths, and recoveries in Bangladesh, Egypt, Pakistan, and Indonesia with country-specific and inter-country comparisons.",
    tags   = c("R Shiny", "COVID-19", "Epidemiology", "Independent"),
    link   = "https://sites.google.com/view/rmahmood/data-science"
  ),
  list(
    title  = "Toxic Mushroom ML Classifier",
    org    = "UBC MDS",
    period = "2022",
    desc   = "Machine learning model predicting poisonous mushrooms from morphological features. Group project with Dongxiao Li and Kyle Maj (UBC MDS).",
    tags   = c("Python", "scikit-learn", "ML", "Classification"),
    link   = NULL
  ),
  list(
    title  = "tweetlytics — Python Package",
    org    = "UBC MDS",
    period = "2022",
    desc   = "Python package for Twitter data ingestion, cleaning, analysis, and visualization of hashtags, sentiments, and word counts. With Mahsa Sarafrazi, Shiva Shankar Jena, Amir Abbas Shojakhani.",
    tags   = c("Python", "NLP", "Twitter API", "Package Development"),
    link   = NULL
  ),
  list(
    title  = "rtweetlytics — R Package",
    org    = "UBC MDS",
    period = "2022",
    desc   = "R package with equivalent Twitter analysis functionality to tweetlytics: data ingestion, cleaning, and visualization of hashtags, sentiments, and word counts.",
    tags   = c("R", "NLP", "Twitter API", "Package Development"),
    link   = NULL
  ),
  list(
    title  = "Video Game Sales Dashboard",
    org    = "UBC MDS",
    period = "2022",
    desc   = "R Shiny and Dash (Python) dashboards visualizing NA/global video game sales, top publishers, genres, and market share by year (Kaggle). With Alex Yinan Guo, Amelia Tang, Maeve Shi.",
    tags   = c("R Shiny", "Python Dash", "Plotly", "Kaggle"),
    link   = NULL
  )
)

# ── PUBLICATIONS ─────────────────────────────────────────────────────────────
# All DOIs and PubMed IDs verified from citation data
publications <- list(
  list(
    year    = 2023,
    title   = "Mother's care-seeking behavior for neonatal danger signs from qualified providers in rural Bangladesh: A generalized structural equation modeling and mediation analysis",
    authors = "Azad R, Billah SM, Bhui BR, Ali NB, Herrera S, de Graft-Johnson J, Garg L, Priyanka SS, Zubair S, Rokonuzzaman SM, <strong>Rahman M</strong>",
    journal = "Frontiers in Pediatrics",
    detail  = "2023;10:929157",
    link    = "https://doi.org/10.3389/fped.2022.929157",
    doi     = "10.3389/fped.2022.929157"
  ),
  list(
    year    = 2022,
    title   = "Population-based rates, risk factors and consequences of preterm births in South-Asia and sub-Saharan Africa: A multi-country prospective cohort study",
    authors = "AMANHI GA Study Group",
    journal = "Journal of Global Health",
    detail  = "2022;12:04011",
    link    = "https://doi.org/10.7189/jogh.12.04011",
    doi     = "10.7189/jogh.12.04011"
  ),
  list(
    year    = 2021,
    title   = "Simplified models to assess newborn gestational age in low-middle income countries: findings from a multicountry, prospective cohort study",
    authors = "AMANHI Gestational Age Study Group",
    journal = "BMJ Global Health",
    detail  = "2021;6(9):e005688",
    link    = "https://gh.bmj.com/content/6/9/e005688",
    doi     = "10.1136/bmjgh-2021-005688"
  ),
  list(
    year    = 2021,
    title   = "Prevalence and factors associated with skin-to-skin contact (SSC) practice: findings from a population-based cross-sectional survey in 10 selected districts of Bangladesh",
    authors = "Ali NB, Priyanka SS, Bhui BR, Herrera S, Azad MR, Karim A, Shams Z, <strong>Rahman M</strong>, Rokonuzzaman SM, Meena US, El Arifeen S",
    journal = "BMC Pregnancy and Childbirth",
    detail  = "2021 Dec;21:1–3",
    link    = "https://doi.org/10.1186/s12884-021-04317-3",
    doi     = "10.1186/s12884-021-04317-3"
  ),
  list(
    year    = 2020,
    title   = "Performance of late pregnancy biometry for gestational age dating in low-income and middle-income countries: a prospective, multicountry, population-based cohort study (AMANHI)",
    authors = "Deb S, Mohammed MS, Dhingra U, Dutta A, Ali SM, Dixit P, et al. (AMANHI Study Group)",
    journal = "The Lancet Global Health",
    detail  = "2020;8(4):e545–54",
    link    = "https://doi.org/10.1016/S2214-109X(20)30018-5",
    doi     = "10.1016/S2214-109X(20)30018-5"
  ),
  list(
    year    = 2020,
    title   = "Urinary tract infections in pregnancy in a rural population of Bangladesh: population-based prevalence, risk factors, etiology, and antibiotic resistance",
    authors = "Lee AC, Mullany LC, Koffi AK, Rafiqullah I, Khanam R, Folger LV, <strong>Rahman M</strong>, Mitra DK, Labrique A, Christian P, Uddin J",
    journal = "BMC Pregnancy and Childbirth",
    detail  = "2020 Dec;20(1):1–11",
    link    = "https://doi.org/10.1186/s12884-020-03302-0",
    doi     = "10.1186/s12884-020-03302-0"
  ),
  list(
    year    = 2019,
    title   = "Development and evaluation of a mobile application for case management of small and sick newborns in Bangladesh",
    authors = "Schaeffer LE, Ahmed S, <strong>Rahman M</strong>, Whelan R, Rahman S, Roy AD, Nijhum TA, Bably NN, D'Couto H, Hudelson C, Jaben IA",
    journal = "BMC Medical Informatics and Decision Making",
    detail  = "2019 Dec;19(1):1–12",
    link    = "https://doi.org/10.1186/s12911-019-0969-5",
    doi     = "10.1186/s12911-019-0969-5"
  ),
  list(
    year    = 2019,
    title   = "A novel icterometer for hyperbilirubinemia screening in low-resource settings",
    authors = "Lee AC, Folger LV, <strong>Rahman M</strong>, Ahmed S, Bably NN, Schaeffer L, Whelan R, Panchal P, Rahman S, Roy AD, Baqui AH",
    journal = "Pediatrics",
    detail  = "2019;143(5):e20182039",
    link    = "https://doi.org/10.1542/peds.2018-2039",
    doi     = "10.1542/peds.2018-2039"
  ),
  list(
    year    = 2019,
    title   = "Effect of population-based antenatal screening and treatment of genitourinary tract infections on birth outcomes in Sylhet, Bangladesh (MIST): a cluster-randomised clinical trial",
    authors = "Lee AC, Mullany LC, Quaiyum M, Mitra DK, Labrique A, Christian P, Ahmed P, Uddin J, Rafiqullah I, DasGupta S, <strong>Rahman M</strong>",
    journal = "The Lancet Global Health",
    detail  = "2019;7(1):e148–59",
    link    = "https://doi.org/10.1016/S2214-109X(18)30441-8",
    doi     = "10.1016/S2214-109X(18)30441-8"
  ),
  list(
    year    = 2019,
    title   = "Prevalence of and risk factors for abnormal vaginal flora and its association with adverse pregnancy outcomes in a rural district in northeast Bangladesh",
    authors = "Baqui AH, Lee AC, Koffi AK, Khanam R, Mitra DK, Dasgupta SK, Uddin J, Ahmed P, Rafiqullah I, <strong>Rahman M</strong>, Quaiyum A",
    journal = "Acta Obstetricia et Gynecologica Scandinavica",
    detail  = "2019;98(3):309–19",
    link    = "https://doi.org/10.1111/aogs.13491",
    doi     = "10.1111/aogs.13491"
  ),
  list(
    year    = 2019,
    title   = "Association of smoking and smokeless tobacco with migraine",
    authors = "<strong>Rahman M</strong>, et al.",
    journal = "See Google Scholar for full citation",
    detail  = "2019",
    link    = "https://scholar.google.com/citations?user=EuKI7bAAAAAJ&hl=en",
    doi     = NULL
  ),
  list(
    year    = 2017,
    title   = "Development and validation of a simplified algorithm for neonatal gestational age assessment — protocol for the AMANHI prospective cohort study",
    authors = "Baqui A, Ahmed P, Dasgupta SK, Begum N, <strong>Rahman M</strong>, Islam N, Quaiyum M, Kirkwood B, Edmond K, Shannon C, Newton S",
    journal = "Journal of Global Health",
    detail  = "2017;7(2):020509",
    link    = "https://doi.org/10.7189/jogh.07.020509",
    doi     = "10.7189/jogh.07.020509"
  )
)

# ── EDUCATION ────────────────────────────────────────────────────────────────
education <- list(
  degrees = list(
    list(year="2021–22", degree="Master of Data Science",
         school="University of British Columbia", location="Vancouver, BC",
         link="https://masterdatascience.ubc.ca/",
         note="Dept. of Statistics & Computer Science. First from Bangladesh admitted."),
    list(year="2017–18", degree="Master of Public Health in Epidemiology",
         school="Independent University, Bangladesh", location="Dhaka, Bangladesh",
         link=NULL,
         note="Thesis: Assessment of Health Facility Readiness to deliver ANC per WHO recommendations."),
    list(year="2005–13", degree="Bachelor of Medicine and Surgery (MBBS)",
         school="University of Dhaka", location="Dhaka, Bangladesh",
         link=NULL, note="")
  ),
  training = list(
    list(year="Jul 2023", degree="Deep Learning & Reinforcement Learning (Summer School)",
         school="Mila – Quebec AI Institute", location="Montreal, QC",
         link="https://miladeeplearningsummerschool.ca/",
         note="Hosted by CIFAR, Mila, Amii, Vector Institute. Instructors incl. Yoshua Bengio, Doina Precup, Christopher Pal."),
    list(year="Oct–Nov 2025", degree="Foundations of AI and Machine Learning",
         school="AI for Public Health (AI4PH)", location="Online",
         link="https://ai4ph.ca/",
         note="Supervised & unsupervised ML for public health, with intermediate R."),
    list(year="Feb–Mar 2026", degree="Handling Missing Data in Health Research",
         school="AI for Public Health (AI4PH)", location="Online",
         link="https://ai4ph.ca/",
         note="MCAR/MAR/MNAR mechanisms, ML-based imputation strategies.")
  ),
  secondary = list(
    list(year="1998–2001", degree="HSC, Science", school="Khulna Public College", location="Khulna, Bangladesh"),
    list(year="2001–2003", degree="SSC, Science", school="Khulna Public School & College", location="Khulna, Bangladesh")
  )
)

# ── CERTIFICATIONS ────────────────────────────────────────────────────────────
certifications <- list(
  list(name="Tri-Council Policy Statement: Ethical Conduct for Research Involving Humans (TCPS 2, 2022)",
       issuer="Interagency Advisory Panel on Research Ethics", date="Jan 2026",
       link="https://tcps2core.ca/"),
  list(name="Foundations of AI and Machine Learning",
       issuer="AI4PH Health Research Training Platform", date="Dec 2025",
       link="https://ai4ph.ca/"),
  list(name="CLIC — Cours de langue pour les immigrants au Canada, Level 1 (French)",
       issuer="Collège Éducacentre", date="Mar 2025", link=NULL),
  list(name="San'Yas: Core Anti-Racism Indigenous Cultural Safety Training",
       issuer="Provincial Health Services Authority", date="Sep 2022",
       link="https://www.sanyas.ca/"),
  list(name="Data Science and Health 2021: COVID-19 Pandemic (CPD, 9 credits)",
       issuer="UBC Data Science and Health", date="Jan 2022",
       link="https://datascienceandhealth.ubc.ca/"),
  list(name="Web-based Training: Protecting Human Research Participants",
       issuer="NIH Office of Extramural Research", date="Mar 2018",
       link="https://phrp.nihtraining.com/"),
  list(name="Good Clinical Practice and ICH (GCP)",
       issuer="icddr,b / JHU", date="Jul 2017", link=NULL),
  list(name="Johns Hopkins Basic Human Subjects Research Course",
       issuer="Johns Hopkins Bloomberg School of Public Health", date="May 2017",
       link="https://www.bloomberg.jhu.edu/"),
  list(name="Applying Propensity Score Approaches to Complex Survey Data",
       issuer="ICAS, ISRT, DU / icddr,b", date=NULL, link=NULL),
  list(name="Advanced Biostatistical Methods and Stata",
       issuer="icddr,b", date=NULL, link=NULL)
)

# ── AFFILIATIONS ──────────────────────────────────────────────────────────────
affiliations <- list(
  ph = list(
    list(org="AI4PH Health Research Training Program", role="Community Advisory Board Member",
         link="https://ai4ph.ca/"),
    list(org="Women's Health Research Institute", role="Full Member",
         link="https://www.whri.org/"),
    list(org="Global Burden of Disease (GBD) Collaborator Network", role="Member",
         link="https://www.healthdata.org/gbd"),
    list(org="Canadian Public Health Association", role="Student Member",
         link="https://www.cpha.ca/"),
    list(org="Public Health Association of British Columbia", role="Student Member",
         link="https://phabc.org/"),
    list(org="One Health Bangladesh", role="Life Member", link=NULL),
    list(org="Bangladesh Medical Association (BMA)", role="General Member", link=NULL)
  ),
  ds = list(
    list(org="UBC Data Science and Health", role="Cluster Member",
         link="https://datascienceandhealth.ubc.ca/people/mahmoodur-rahman"),
    list(org="Temerty Centre for AI Research and Education in Medicine (T-CAIREM)", role="Member",
         link="https://tcairem.utoronto.ca/"),
    list(org="Data Visualization Society", role="Basic Member",
         link="https://www.datavisualizationsociety.org/"),
    list(org="Statistical Society of Canada", role="Associate Member",
         link="https://ssc.ca/")
  )
)

# ── MENTORSHIP ───────────────────────────────────────────────────────────────
mentorship <- list(
  list(event="National Health Datathon 2026", date="Mar 7–8, 2026", link=NULL),
  list(event="UBC Medicine Datathon 2025", date="Mar 22–23, 2025",
       link="https://ubcmedicinedatathon.com/"),
  list(event="Women In Data Science, UBC (WiDS@UBC) AlumNight", date="Oct 25, 2024", link=NULL),
  list(event="National Health Datathon 2024", date="Nov 9–10, 2024", link=NULL),
  list(event="Immigrant Employment Council of BC — MentorConnect Program", date=NULL,
       link="https://iecbc.ca/")
)
