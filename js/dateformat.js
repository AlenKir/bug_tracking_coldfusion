function format(d) {
    let msec = Date.parse(d);
    const d = new Date(msec);
    document.getElementById("date2format").innerHTML = "Date: " + d;
}