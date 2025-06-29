[ A sample database for testing E-Prolog.  See the
documentation file EPRO.DOC.			]

((father jack ken))
((father jack karen))
((grandparent ?grandparent ?grandchild)
	(parent ?grandparent ?parent)
	(parent ?parent ?grandchild))
((mother el ken))
((mother cele jack))
((parent ?parent ?child)
	(mother ?parent ?child))
((parent ?parent ?child)
	(father ?parent ?child))
