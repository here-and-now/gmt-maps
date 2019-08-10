import pygmt
fig = pygmt.Figure()
fig.basemap(region="g", projection="W10i", frame=True)
fig.coast(shorelines=True)
fig.savefig("BlackSea.png")
fig.show()

