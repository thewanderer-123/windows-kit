In Any PE(portable excutable) file in the field streams there five heaps 
- #Strings 
- #Blob (stands for binary large object)
- #US   (stands for User String)
- #GUID (stands for Global unqiue idenifier)
- #~    (stands for stream)

- #string
where the idenifier strings are stored

- #US
points to the physical representation of the user's string heap

- #Blob
points to the physical representation of the blob heap

- #GUID
points to the physical representation of the GUID heap

- #~
points to the physical representation of the logical metadata tables
