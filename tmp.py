def searchSquare(arr: list[int], tgt: int) -> bool | None:
    if tgt < arr[0] or arr[-1] < tgt:
        print("False: tgt is too small")
        return False
    low, high = (0, len(arr) -1)
    while high >= low:
        mid = (high + low) // 2
        curr = arr[mid]
        if tgt < curr:
            high = mid - 1
        elif curr < tgt:
            low = mid + 1
        else: # curr == tgt
            print("True")
            return True
    print(low)
    return None
    
def main() -> None:
    arr = [1, 3, 5]
    for tgt in range(0, arr[-1]+1):
        searchSquare(arr, tgt)

if __name__ == "__main__":
    main()