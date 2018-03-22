package com.uucyan.girlsbandpartyprofileapi.controller

import org.springframework.http.ResponseEntity
import org.springframework.http.HttpStatus
/*import org.springframework.web.bind.annotation.RequestHeader*/
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RestController
import org.springframework.web.bind.annotation.PathVariable
import com.uucyan.girlsbandpartyprofileapi.entity.BangDreamer
import com.uucyan.girlsbandpartyprofileapi.service.BangDreamerService

@RestController
@RequestMapping("/bangDreamer")
class BangDreamerController(private val bangDreamerService: BangDreamerService) {

    // データ全取得
    @RequestMapping("")
    fun index(): ResponseEntity<MutableList<BangDreamer>> {
        return ResponseEntity.ok(bangDreamerService.findAllBangDreamer())
    }

    // id指定でデータ取得
    @RequestMapping("/{id}")
    fun show(@PathVariable("id") id : Long): ResponseEntity<BangDreamer> {
        val bangDreamer: BangDreamer? = bangDreamerService.findById(id)
        bangDreamer?.let { return ResponseEntity.ok(bangDreamer) }
            ?: run { return ResponseEntity(HttpStatus.NOT_FOUND) }
    }

    // データ追加
    @RequestMapping("", method = arrayOf(RequestMethod.POST))
    fun create(@RequestBody bangDreamer: BangDreamer): ResponseEntity<String> {
        bangDreamerService.save(bangDreamer)
        return ResponseEntity.ok("Success")
    }

    // データ更新
    @RequestMapping("", method = arrayOf(RequestMethod.PUT))
    fun save(@RequestBody bangDreamer: BangDreamer): ResponseEntity<String> {
        bangDreamerService.save(bangDreamer)
        return ResponseEntity.ok("Success")
    }

    // データ削除
    @RequestMapping("/{id}",method = arrayOf(RequestMethod.DELETE))
    fun delete(@PathVariable("id") id : Long):ResponseEntity<String>{
        val bangDreamer: BangDreamer? = bangDreamerService.findById(id)
        bangDreamer?.run {
            bangDreamerService.delete(bangDreamer)
        }
        return ResponseEntity.ok("Success")
    }
}
