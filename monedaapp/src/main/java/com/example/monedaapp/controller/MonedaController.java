package com.example.monedaapp.controller;

import com.example.monedaapp.model.Moneda;
import com.example.monedaapp.repository.MonedaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/monedas")
public class MonedaController {

    @Autowired
    private MonedaRepository monedaRepository;

    // GET /api/monedas
    @GetMapping
    public ResponseEntity<List<Moneda>> getAllMonedas() {
        List<Moneda> monedas = monedaRepository.findAll();
        return ResponseEntity.ok(monedas);
    }

    // GET /api/monedas/{id}
    @GetMapping("/{id}")
    public ResponseEntity<Moneda> getMonedaById(@PathVariable Long id) {
        Optional<Moneda> monedaOptional = monedaRepository.findById(id);
        return monedaOptional.map(ResponseEntity::ok).orElseGet(() -> ResponseEntity.notFound().build());
    }

    // POST /api/monedas
    @PostMapping
    public ResponseEntity<Moneda> createMoneda(@RequestBody Moneda moneda) {
        Moneda nuevaMoneda = monedaRepository.save(moneda);
        return ResponseEntity.ok(nuevaMoneda);
    }

    // PUT /api/monedas/{id}
    @PutMapping("/{id}")
    public ResponseEntity<Moneda> updateMoneda(@PathVariable Long id, @RequestBody Moneda moneda) {
        Optional<Moneda> monedaOptional = monedaRepository.findById(id);
        if (monedaOptional.isPresent()) {
            Moneda monedaExistente = monedaOptional.get();
            monedaExistente.setNombre(moneda.getNombre());
            monedaExistente.setCodigo(moneda.getCodigo());
            monedaExistente.setPais(moneda.getPais());
            Moneda monedaActualizada = monedaRepository.save(monedaExistente);
            return ResponseEntity.ok(monedaActualizada);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    // DELETE /api/monedas/{id}
    @DeleteMapping("/{id}")
    public ResponseEntity<?> deleteMoneda(@PathVariable Long id) {
        return monedaRepository.findById(id).map(moneda -> {
            monedaRepository.deleteById(id);
            return ResponseEntity.noContent().build();
        }).orElseGet(() -> ResponseEntity.notFound().build());
    }

    // NUEVA OPERACIÓN: RECUPERAR /api/monedas/recuperar/{id}
    @PostMapping("/recuperar/{id}")
    public ResponseEntity<?> recuperarMoneda(@PathVariable Long id) {
        return monedaRepository.findById(id).map(moneda -> {
            // Aquí se puede realizar cualquier acción necesaria para "recuperar" la moneda
            // En este ejemplo, simplemente retornamos un ResponseEntity.ok() sin modificar la moneda
            return ResponseEntity.ok().build();
        }).orElseGet(() -> ResponseEntity.notFound().build());
    }
}
