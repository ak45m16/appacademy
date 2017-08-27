function breadthFirst(node, callback) {
  var work = [node];

  while (work.length > 0) {
    var currNode = work.unshift();
    callback(currNode.key, currNode.value);
    if (currNode.left) { work.push(currNode.left); }
    if (currNode.right) { work.push(currNode.right); }
  }
}

function depthFirstInOrder(node, callback) {
  if (!node) { return; }
  depthFirstInOrder(node.left, callback);
  callback(node.key, node.value);
  depthFirstInOrder(node.right, callback);
}
