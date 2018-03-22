package com.uucyan.girlsbandpartyprofileapi.entity

import javax.persistence.*
import java.time.LocalDateTime
import java.io.Serializable

@Entity
@Table(name = "bang_dreamer")
data class BangDreamer(
    @Column(name="name", nullable = false)
    var name: String,
    @Column(name="password", nullable = false)
    var password: String,
    @Column(name="last_login_at", nullable = true, updatable = false)
    var lastLoginAt: LocalDateTime?,
    @Column(name="created_at", nullable = true, updatable = false)
    var createdAt: LocalDateTime?,
    @Column(name="updated_at", nullable = true)
    var updatedAt: LocalDateTime?,
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    var id: Long
): Serializable
