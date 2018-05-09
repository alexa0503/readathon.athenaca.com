export function maxSlice (v,maxLength = 35) {
    let l = 0;
    let ll = 0;
    for (let i = 0; i < v.length; i++) {
        if (/[\x00-\xff]/.test(v[i])) {
            l += 1;
        } else {
            l += 2;
        }
        if (l >= maxLength) {
            ll = i;
            break;
        }
    }
    return l >= maxLength ? v.slice(0, ll) + '...' : v;
}