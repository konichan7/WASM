var memory;

fetch('../out/main.wasm').then(response =>
  response.arrayBuffer()
).then(bytes => WebAssembly.instantiate(bytes, {
  env: {
    jsprint: function jsprint(byteOffset) {
      var s = '';
      var a = new Uint8Array(memory.buffer);
      for (var i = byteOffset; a[i]; i++) {
        s += String.fromCharCode(a[i]);
      }
      document.write(s);
    }
  }
})
).then(results => {
  instance = results.instance;
  memory = instance.exports.pagememory;
  instance.exports.helloworld();
}).catch(console.error);



// fetch('../out/main.wasm').then(response =>
//   response.arrayBuffer()
// ).then(bytes => WebAssembly.instantiate(bytes)).then(results => {
//   instance = results.instance;
//   document.getElementById("container").textContent = instance.exports.helloworld();
// }).catch(console.error);

