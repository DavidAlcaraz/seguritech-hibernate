package com.seguritech.practicafinal.domain.repositories;

import com.seguritech.practicafinal.domain.Rol;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 *
 * @author Werner
 */
public interface RolRepository extends JpaRepository<Rol, Long>{
    
    List<Rol> findByDescripcion(String descripcion);
}
