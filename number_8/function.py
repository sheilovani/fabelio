import collections

def filter_duplicates(arr1, arr2):
    mergedArr = arr1 + arr2
    seen = set()
    seen_add = seen.add
    duplicates = set( x for x in mergedArr if x in seen or seen_add(x) )
    return list( duplicates )

a = [1,2,3]
b = [2,3,4,5]
print(filter_duplicates(a, b))