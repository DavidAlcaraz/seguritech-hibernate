package com.seguritech.practicafinal.controllers;

import com.seguritech.practicafinal.domain.Rol;
import com.seguritech.practicafinal.domain.repositories.RolRepository;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author Werner
 */
@RestController
public class RolController {

    @Autowired
    private RolRepository rolRepository;

    @GetMapping(value = "/rol")
    public List<Rol> listAll() {
        List<Rol> roles = rolRepository.findAll();
        System.out.println(roles.size());
        return roles;
    }

    @GetMapping("/rol/{id}")
    public ResponseEntity<Rol> getRol(@PathVariable("id") Long id) {
        Rol rol = rolRepository.findOne(id);
        if (rol == null) {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(rol);
    }

    @GetMapping(value = "/rol", params = {"descripcion"})
    public List<Rol> listAll(String descripcion) {
        List<Rol> roles = rolRepository.findByDescripcion(descripcion);
        return roles;
    }
    
    @PostMapping("/rol")
    public ResponseEntity<Rol> create(@RequestBody Rol rol) throws URISyntaxException {
        if (rol.getId() != null) {
            return ResponseEntity.badRequest().header("X-error", "El id debe ser null").body(null);
        }
        rolRepository.save(rol);
        return ResponseEntity.created(new URI("/rol/" + rol.getId())).body(rol);
    }
    
    
    @PutMapping("/rol")
    public ResponseEntity<Rol> update(@RequestBody Rol rol) throws URISyntaxException {
        if (rol.getId() == null) {
            return ResponseEntity.badRequest().header("X-error", "El id no debe ser null").body(null);
        }
        rolRepository.save(rol);
        return ResponseEntity.ok().body(rol);
    }
    
    
    @DeleteMapping("/rol/{id}")
    public ResponseEntity<Rol> deleteRol(@PathVariable("id") Long id) {
        rolRepository.delete(id);
        return ResponseEntity.ok().build();
    }
}
