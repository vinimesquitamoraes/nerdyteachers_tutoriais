pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
--anthony eu te amo
function _init()
	--variaveis de jogo
	gravidade = 1
	nivel				 = 1
	pontos    = 0

	--objetos
	jg = init_jg()
	fr = init_frutas()
	
end

function _update()
	jg:mov()
	fr:update()

end

function _draw()
	--[[
 cls()
 --terreno
 rectfill(0,108,127,127,3)
 --jogador
	jg:des()
	fr:des()
end
-->8
--jogador
function init_jg()
	new_jg = {
		x								 = 64,
		y								 = 100,
		w									=	8,
		h									=	8,
		cesta_s		 = 1,
		jogador_s = 2,
		--desenha o jogador
 	des = function(self,xop,yop)
		 aux_x,aux_y = xop or self.x,yop or self.y 
	 	spr(self.cesta_s	 ,aux_x,aux_y-9)
	 	spr(self.jogador_s,aux_x,aux_y)
	 end,
	 --move o jogador
 	mov = function(self)
			if(btn(⬅️)) self.x-=2
			if(btn(➡️)) self.x+=2
			nao_sai(self)
	 end,
	 
 }
	return new_jg
end
-->8
--frutas
function init_frutas()
	frutas= {
	 update = function(self)
			for i in all(frutas)do
				i.y+=gravidade
				i:col(jg)
			end
			if #frutas==0 then
    nivel+=1
    init_frutas()
			end
	 end,

 	des = function(self,xop,yop)
			foreach(frutas, function(obj) obj:des() end)
	 end,
	
	}
	
	local start				 = 3
	local cont						= 6
	local intervalo = 16
	
 for i=1,nivel do
  fruta={
   s = flr(rnd(cont)+start),
   x	= flr(rnd(120)+5),
   y = i*(-intervalo),
		--desenhar
 	des = function(self,xop,yop)
		 aux_x,aux_y = xop or self.x, yop or self.y 
	 	spr(self.s,aux_x,aux_y)
	 end,
	 
	 col = function(self,jogador)
		 if   self.y+4 >= jogador.y-8
				and self.y+4 <= jogador.y
				and self.x+4 >= jogador.x
				and self.x+4 <= jogador.x+8
		 then
	   pontos+=1
	   del(frutas,self)
			end
	 end
  }
  add(frutas,fruta)
 end

	return frutas
end
-->8
--utilitarios
function nao_sai(self)
	--nao sai horitzontal
	if(self.x < 0)		self.x = 0
	if(self.x+self.w > 128)self.x = 128 - self.w
end

function nao_sai(self)
	--nao sai horitzontal
	if(self.x < 0)		self.x = 0
	if(self.x+self.w > 128)self.x = 128 - self.w
end
__gfx__
000000007000000770700707000110000090900000700700000006000100000000777d0000000000000000000000000000000000000000000000000000000000
0000000067777776707777070011110040949094070000700060060011100001070000d000000000000000000000000000000000000000000000000000000000
0070070060d050567d0770d70111c110909994990700007000060060990001017077000d00000000000000000000000000000000000000000000000000000000
000770006d0d050d07d00d700c1c1c10949999990700007060600600910100117070100d00000000000000000000000000000000000000000000000000000000
0007700060d0505d00777700dcc1c1c199999999007007000606006011901091d00c0d0d00000000000000000000000000000000000000000000000000000000
007007006d0d050d00777700dccc1cc199aaaa99000770000060060609190119d000d70d00000000000000000000000000000000000000000000000000000000
0000000060d0505d007777d0ddcccc1d4aaaaaa40077770006766760011919100d00007000000000000000000000000000000000000000000000000000000000
00000000066dddd0077dd77d0dddddd0049aa94000077000007777001091190100ddd70000000000000000000000000000000000000000000000000000000000
