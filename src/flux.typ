#import "@local/evan:1.0.0":*

= Flux <sec-flux>

== [TEXT] 2D flux, and Green's theorem in flux form

I will grudgingly define 2D flux first, since I just went over Green's theorem.
I say "grudgingly" because 2D flux is an awkward hacked special case of 3D flux,
forced to work in two dimensions.
But okay, gotta follow the script.

The idea of flux is that you have some closed curve $cal(C)$ in $RR^2$.
When we had a work integral, we went along the curve $cal(C)$ and added together the
dot product of the vector field with the tangent vectors on that vector field.

With 2D flux, we instead take the dot product of the vector field
with the _normal vector_ rather than the tangent vector.
This should be drawn as a _$90 degree$ clockwise rotation of $bf(r)'(t)$_.
Seriously, I can't make this up.

#figure(
  image("figures/flux-2d-dot.png", width: auto),
  caption: [The 2D flux is the dot product where the tangent $bf(r)'(t)$ is replaced by its rotated version.],
)

In any case, the 2D flux is then defined as follows.
#definition(title: [Definition of 2D flux])[
  The 2D flux of a vector field $bf(F)$ through the curve $cal(C)$
  parametrized by $bf(r)(t)$ is defined by
  $ int_(t="start time")^("stop time") bf(F)(bf(r)(t)) dot
    (90 degree "clockwise rotation of" bf(r)'(t)) dif t. $
]
Aquatically, if the curve $cal(C)$ is thought of as some permeable membrane,
then the 2D flux measures the rate the current passes through the membrane.
Assuming $cal(C)$ is oriented counterclockwise,
the 2D flux is positive if water is (net) moving out of $cal(C)$; it's negative if it flows in.

The "$90 degree$ clockwise rotation of $bf(r)'(t)$" is so awkward
that you can bet people immediately made up a shorthand to sweep it under the rug.
I think the usual notation is
$ bf(n) dif s := (90 degree "clockwise rotation of" bf(r)'(t)) dif t $
so that the above thing will usually be condensed to
$ oint_(cal(C)) bf(F) dot bf(n) dif s. $
#digression(title: [Digression on why $bf(n) dif s$ is the shorthand])[
  I think the reason this shorthand is used is:
  $bf(n)$ is supposed to be the "outward unit normal vector",
  i.e. a vector of length $1$ whose direction is $90 degree$ rotated from $bf(r)'(t)$.
  So then it needs to be scaled by the magnitude $|bf(r)'(t)|$,
  and so we copy the old $dif s$ from arc length.

  I _promise_ that none of this was my idea.
]

#warning[
  The rotated $bf(r)'(t)$ is sometimes called the "outward normal vector".
  However, despite the name, it only points outward if we oriented $cal(C)$ counterclockwise.
  If $cal(C)$ is clockwise it points inwards instead!
]

== [TEXT] 2D flux is a rotation of 2D work

There is another way to write the flux with shorthand that avoids $bf(n) dif s$ notation.
To see where it comes from, once again write
$ bf(F)(x,y) = vec(p(x,y), q(x,y)). $
Rather than rotating $bf(r)'(t)$ by $90 degree$ clockwise,
let's imagine we instead rotated $bf(F)$ by $90 degree$ clockwise instead, and define:
$ bf(F)^perp (x,y) := vec(q(x,y), -p(x,y)). $
In that case, we have
$ bf(F) dot (90 degree "clockwise rotation of " bf(r)') = bf(F)^perp dot bf(r)'. $
So what we've done is put the rotation thing onto the vector field instead.

The upshot of this is that we can actually change the flux into a work integral:
$ oint_(cal(C)) bf(F) dot bf(n) dif s = oint_(cal(C)) bf(F)^perp dot dif bf(r). $
This looks a bit better but we still want to get rid of $bf(F)^perp$.
But we can, because there is a shorthand for work that uses just $p$ and $q$; we get
$ oint_(cal(C)) bf(F)^perp dot dif bf(r) = oint_(cal(C)) (-q dif x + p dif y). $
In summary, we get the following more readable shorthand:

#definition(title: [Better definition of 2D flux using work shorthand])[
  Let $bf(F)(x,y) = vec(p(x,y), q(x,y))$ be a 2D vector field
  and let $cal(C)$ be a closed loop in $RR^2$.
  Then the flux of $bf(F)$ through $cal(C)$ is defined as
  $ oint_(cal(C)) (-q dif x + p dif y). $
]

In particular, that means we can apply Green's theorem again;
the resulting theorem is called _Green's theorem in flux form_:
we get that
$ oint_(cal(C)) (-q dif x + p dif y)
  = iint_(cal(R)) ((partial p) / (partial x) + (partial q) / (partial y)) dif A. $
The right-hand side is 2D divergence, so it could be condensed even further to
$ iint_(cal(R)) nabla dot bf(F) dif A. $
There's like four different versions of the same expression now,
so let me just put everything in one place for sanity's sake:

#memo(title: [Memorize: Green's theorem in flux form])[
  Suppose $cal(C)$ is a closed curve oriented counterclockwise enclosing a region $cal(R)$.
  We have
  $ underbrace(oint_(cal(C)) (-q dif x + p dif y), = oint_(cal(C)) (bf(F) dot bf(n) dif s))
    = underbrace(iint_(cal(R)) ((partial p) / (partial x) + (partial q) / (partial y)) dif A,
      = iint_(cal(R)) nabla dot bf(F) dif A). $
]


== [TEXT] 3D flux

#todo[This entire section is to be written]

== [EXER] Exercises
