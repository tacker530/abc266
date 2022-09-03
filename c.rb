# C - Convex Quadrilateral
vertex = []
4.times do |i|
  vertex[i] = gets.chomp.split.map(&:to_i)
end



def myProduct(x,y)
  val = x[0]* y[1] - x[1]*y[0]
  if val >= 0 then
    true
  else
    false
  end
end

def outer(a,b,c,d)
  ab = [ b[0] - a[0], b[1] - a[1] ,0 ]
  bc = [ c[0] - b[0], c[1] - b[1] ,0 ]
  cd = [ d[0] - c[0], d[1] - c[1] ,0 ]
  da = [ a[0] - d[0], a[1] - d[1] ,0 ]

  l =  myProduct(ab,bc) 
  m =  myProduct(bc,cd)
  n =  myProduct(cd,da)
  o =  myProduct(da,ab)

  if l == m and m == n and n == o then
    puts "Yes"
  else
    puts "No"
  end
end

outer(vertex[0],vertex[1],vertex[2],vertex[3])