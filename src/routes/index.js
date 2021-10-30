const { Router} = require('express');
const router = Router();

router.get('/test', (req, res) => {
    res.json({"Tittle": "Hi"});
});

module.exports = router;