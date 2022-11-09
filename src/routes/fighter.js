process.env['NODE_TLS_REJECT_UNAUTHORIZED'] = 0
import express from 'express';
import { prependOnceListener } from '../database';
const pool = require('../database');
const router = express.Router();


//buscar todos los peleadores 
router.get('/fighter/fighters', async (req, res) => {
    try {
        const rows = await pool.query(`SELECT * FROM fighters`);
        return res.status(200).json({
            result : 'ok',
            sites: rows
        });

    } catch (error) {
        return res.status(400).json({
            mensaje: 'Ocurrio un error',
            result: error
        })
    }
});


//insertar peleador
router.post('/fighter/insertfighter/', async (req, res) => {
    try {
            const {name, name2,lastname,lastname2,age,fk_countri,fk_division,fk_gender,Nickname} = req.body
            console.log( name, name2,lastname,lastname2,age,fk_countri,fk_division,fk_gender,Nickname );
            const rows = await pool.query(` INSERT INTO fighters (name, name2,lastname,lastname2,age,fk_countri,fk_division,fk_gender,Nickname) VALUES ('${name}','${name2}','${lastname}','${lastname2}',${age},${fk_countri},${fk_division},${fk_gender},'${Nickname}') `);

        return res.status(200).json({
            result : 'ok',
            sites: rows
        });

    } catch (error) {
        return res.status(400).json({
            mensaje: 'Ocurrio un error',
            result: error
        })
    }
});



//actualizar peleador
router.put('/fighter/updatefighter/', async (req, res) => {
    try {
            const {id_fighter,name, name2,lastname,lastname2,age,fk_countri,fk_division,fk_gender,Nickname} = req.body
            
            const rows = await pool.query(` UPDATE fighters
            SET  name =  '${name}' , name2 = '${name2}', lastname = '${lastname}' , lastname2 ='${lastname2}' , age = ${age}, fk_countri =${fk_countri} , fk_division = ${fk_division}, fk_gender = ${fk_gender}, Nickname = '${Nickname}' 
            WHERE id_fighter = ${id_fighter} ; `)
            

        return res.status(200).json({
            result : 'ok',
            sites: rows
        });

    } catch (error) {
        return res.status(400).json({
            mensaje: 'Ocurrio un error',
            result: error
        })
    }
});



//eliminar peleador
router.delete('/fighter/deletefighter/', async (req, res) => {
    try {
            
        const rows = await pool.query(`DELETE FROM fighters WHERE id_fighter=${req.body.id}; `)
            
        return res.status(200).json({
            result : 'ok',
            sites: rows
        });

    } catch (error) {
        return res.status(400).json({
            mensaje: 'Ocurrio un error',
            result: error
        })
    }
});


//buscar por apodo
router.get('/fighter/fighterbyname/:nickname', async(req, res) => {

    try {
      
        const { nickname } = req.params
        //Variables para buscar camaras por ipserver
        console.log(`SELECT * FROM ufccc.fighters where Nickname= '${nickname}'`);
       const rows = await pool.query(`SELECT * FROM ufccc.fighters where Nickname= '${nickname}'`  )
        return res.status(200).json({
                site: rows
            });
    } catch (error) {
        return res.status(400).json({
            mensaje: 'Ocurrio un error',
            error
        })
    }

});


// Exportacion de router
module.exports = router;