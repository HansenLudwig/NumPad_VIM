#Requires AutoHotkey v2.0


Send_HK(key) {
    _ctrl := GetKeyState("LControl", "P")
    _shift := GetKeyState("Shift", "P")
    if _ctrl == 1
        key := "^" . key
    if _shift == 1
        key := "+" . key
    Send key
    Suspend true
    return
}

lev_dist(str1, str2) ; levenshtein_distance
{
    if StrLen(str2) > StrLen(str1) {
        l_char2 := StrSplit(str1)
        l_char1 := StrSplit(str2)
    } else {
        l_char1 := StrSplit(str1)
        l_char2 := StrSplit(str2)
    }
    len_2 := l_char2.Length + 1
    if len_2 == 0
        return l_char1.Length
    l_char1.InsertAt(1, '_')
    l_char2.InsertAt(1, '_')
    len_1 := l_char1.Length
    
    _dp := Array()
    idx1 := 1
    _dp.Push([0])
    while idx1 < len_1 {
        _dp[1].push(idx1)
        idx1 += 1
    }
    idx1 := 2
    while idx1 <= len_1 {
        idx2 := 2
        _dp.Push([idx1 - 1])
        while idx2 <= len_2 {
            if l_char1[idx1] = l_char2[idx2] {
                _dp[idx1].Push(_dp[idx1-1][idx2-1])
            } else {
                _dp[idx1].Push(min(_dp[idx1-1][idx2], _dp[idx1][idx2-1], _dp[idx1-1][idx2-1]) + 1)
            }
            idx2 += 1
        }
        idx1 += 1
    }
    return _dp[len_1][len_2]
}