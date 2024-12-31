package tn.essat.controller;

import java.security.Principal;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.multipart.MultipartFile; // Pour gérer les fichiers envoyés via le formulaire
import java.io.IOException; // Pour gérer les exceptions d'entrée/sortie
import java.nio.file.Files; // Pour travailler avec les fichiers
import java.nio.file.Path; // Représente un chemin vers un fichier ou un dossier
import java.nio.file.Paths; // Utilitaire pour créer des objets Path
import java.nio.file.StandardCopyOption; // Pour spécifier l'option de copie de fichiers

import tn.essat.dao.IMessage;
import tn.essat.dao.IProfil;
import tn.essat.dao.IProject;
import tn.essat.dao.IProposition;
import tn.essat.dao.IRole;
import tn.essat.dao.IUser;
import tn.essat.model.Profil;
import tn.essat.model.Project;
import tn.essat.model.Proposition;
import tn.essat.model.Role;
import tn.essat.model.User;

@Controller
public class AppCRT {

	@Autowired
	private PasswordEncoder passwordEncoder;

	@Autowired
	IProject dao_project;
	@Autowired
	IUser dao_user;
	@Autowired
	IProposition dao_proposition;
	@Autowired
	IMessage dao_msg;
	@Autowired
	IProfil dao_profil;
	@Autowired
	IRole dao_role;

	@RequestMapping(value = "/login", method = { RequestMethod.POST, RequestMethod.GET })
	public String handleLogin(@RequestParam(value = "error", required = false) String error, Model model) {
		String msg = null;
		if (error != null) {
			msg = "Username or Password is incorrect !!";
		}
		model.addAttribute("errorMessge", msg);
		return "login";
	}

	@GetMapping("/registerFreelancer")
	public String RegistrationFormF(Model m) {
		User user = new User();
		
		 Role role = new Role();
		 role.setId(1); 
		 user.setRole("ROLE_FREELANCER");
		m.addAttribute("user", user);
		return "inscriptionFreelancer";

	}

	@GetMapping("/registerClient")
	public String RegistrationFormC(Model m) {
		User user = new User();
		 
		user.setRole("ROLE_CLIENT");
		m.addAttribute("user", user);
		return "inscriptionClient";

	}

	@PostMapping("/saveFreelancer")
	public String registerFreelancer(Model m, @ModelAttribute User user) {
		Role freelancerRole = dao_role.findByRole("FREELANCER");
		user.setRole(freelancerRole);
		user.setEnabled(true);
		user.setPassword(passwordEncoder.encode(user.getPassword()));
		dao_user.save(user);
		return "redirect:/login";

	}

	@PostMapping("/saveClient")
	public String registerClient(Model m, @ModelAttribute User user) {

		Role clientRole = dao_role.findByRole("CLIENT");
		user.setRole(clientRole);
		user.setEnabled(true);
		user.setPassword(passwordEncoder.encode(user.getPassword()));
		dao_user.save(user);
		return "redirect:/login";
	}

	@GetMapping("/addProject")
	public String addProjectForm(Model m) {
		Project project = new Project();
		m.addAttribute("project", project);
		return "addProject";
	}

	@PostMapping("/saveProject")
	public String saveProject(Model m, @ModelAttribute Project project) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		User u = (User) auth.getPrincipal();
		project.setClient(u);
		dao_project.save(project);
		return "redirect:/allProjects";
	}

	@GetMapping("/")
	public String getHome(Model m) {
		List<Project> projs = dao_project.findAll();
		m.addAttribute("projs", projs);
		return "Home";

	}


	@GetMapping("/projClients")
	public String listAvailableProjects(Model model) {
		
		List<Project> projects = dao_project.findAllByClientRole("CLIENT");
		model.addAttribute("projects", projects);
		return "listproject";
	}

	@GetMapping("/detail_project/{id}")
	public String getProjectById(Model m, @PathVariable int id) {
		Optional<Project> proj = dao_project.findById(id);
		m.addAttribute("proj", proj.get());
		Proposition p = new Proposition();
	
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		User u = (User) auth.getPrincipal();

		p.setProj(proj.get());
		p.setFreelancer(u);
		m.addAttribute("prp", p);

		return "detailProject";

	}

	@GetMapping("/projects/client/{id}")
	public String getProjectsClients(Model m, @PathVariable int id, Principal principal) {
		if (principal == null) {
			return "redirect:/login";
		}
		List<Project> ProjC = dao_project.findByClientId(id);
		if (ProjC == null || ProjC.isEmpty()) {
			m.addAttribute("message", "Aucun projet trouvé.");
		}

		m.addAttribute("ProjC", ProjC);
		return "projectsClients";
	}

	@GetMapping("/projects/Freelances/{id}")
	public String getProjectsFreelancers(Model m, @PathVariable int id, Principal principal) {
		if (principal == null) {
			return "redirect:/login";
		}
		List<Project> ProjF = dao_project.findByClientId(id);
		if (ProjF == null || ProjF.isEmpty()) {
			m.addAttribute("message", "Aucun projet trouvé.");
		}

		m.addAttribute("ProjF", ProjF);
		return "projectsFreelances";
	}

	

	
	

	@GetMapping("/addProfil")
	public String addProfilForm(Model m) {
		Profil prf = new Profil();
		m.addAttribute("prf", prf);
		return "addProfil";
	}

	@PostMapping("/saveProfil")
	public String saveProfil(@ModelAttribute Profil prf, Model m) {

		dao_profil.save(prf);
		return "redirect:/allProjects";
	}

	@GetMapping("/profil/{id}")
	public String viewProfil(@PathVariable int id, Model m) {
		Optional<Profil> prf = dao_profil.findById(id);
		if (prf.isPresent()) {
			m.addAttribute("prf", prf.get());
			List<Project> ProjF = dao_project.findByClientId(id);
			if (ProjF == null || ProjF.isEmpty()) {
				m.addAttribute("message", "Aucun projet trouvé.");
			}

			m.addAttribute("ProjF", ProjF);

			return "viewProfil";
		} else {
			m.addAttribute("errorMessage", "Profil introuvable !");
			return "error";
		}
	}

	

}
