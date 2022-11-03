using Polyhedra
using CDDLib
import Oscar

pm = Oscar.Polymake.polytope

poly = pm.product(pm.cyclic(3,20),pm.cyclic(3,20))
M = Matrix{Rational{Int}}(poly.VERTICES)
P = convexhull( [Vector{Rational{Int}}(r[2:end]) for r in eachrow(M)]... )
P = polyhedron(V, CDDLib.Library())

for i in 1:5
    Q = polyhedron(hrep(P), CDDLib.Library())
    @show npoints(P), nhalfspaces(P)
    P = polyhedron(vrep(Q), CDDLib.Library())
end


