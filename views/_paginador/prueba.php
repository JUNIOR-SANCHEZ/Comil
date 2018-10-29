<?php if(isset($this->_paginacion)): ?>

<div id="pagination" style="text-align: center;">
    
        <?php if($this->_paginacion['primero']): ?>

    <a class="pagination" href="<?php echo $link . $this->_paginacion['primero']; ?>">&Lt;</a>

        <?php else: ?>

            <span>&Lt;</span>

        <?php endif; ?>

        <?php if($this->_paginacion['anterior']): ?>

          <a href="<?php echo $link . $this->_paginacion['anterior']; ?>">&lt;</a>

        <?php else: ?>

            <span>&lt;</span>

        <?php endif; ?>

        <?php for($i = 0; $i < count($this->_paginacion['rango']); $i++): ?>

            <?php if($this->_paginacion['actual'] == $this->_paginacion['rango'][$i]): ?>

            <span class="current"><?php echo $this->_paginacion['rango'][$i]; ?></span>

            <?php else: ?>

               
                    <a href="<?php echo $link . $this->_paginacion['rango'][$i]; ?>">
                        <?php echo $this->_paginacion['rango'][$i]; ?>
                    </a>
          

            <?php endif; ?>

        <?php endfor; ?>

        <?php if($this->_paginacion['siguiente']): ?>

            <a href="<?php echo $link . $this->_paginacion['siguiente']; ?>">&gt;</a>

        <?php else: ?>

            <span>&gt;</span>

        <?php endif; ?>

        <?php if($this->_paginacion['ultimo']): ?>

            <a href="<?php echo $link . $this->_paginacion['ultimo']; ?>">&Gt;</a>

        <?php else: ?>

            <span>&Gt;</span>

        <?php endif; ?>
    
</div>

<?php endif; ?>