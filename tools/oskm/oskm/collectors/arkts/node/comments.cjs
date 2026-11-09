'use strict';
function tags(text, start) {
  const found = [];
  let offset = start, fence = null;
  for (const line of text.match(/[^\r\n\u2028\u2029]*(?:\r\n|[\r\n\u2028\u2029]|$)/gu) || []) {
    if (!line) continue;
    const body = line.replace(/^\s*\/\*+/, '').replace(/\*\/\s*$/, '').replace(/^\s*\*?\s?/, '');
    const marker = body.trim().match(/^(`{3,}|~{3,})/);
    if (marker) {
      if (!fence) fence = {char: marker[1][0], length: marker[1].length};
      else if (marker[1][0] === fence.char && marker[1].length >= fence.length &&
               body.trim().slice(marker[1].length).trim() === '') fence = null;
      offset += line.length; continue;
    }
    if (!fence) {
      const match = body.match(/^@(file|kit)\b([^\r\n\u2028\u2029]*)/);
      if (match) {
        const pos = offset + line.indexOf('@' + match[1]);
        const value = match[2].trim();
        found.push({name: match[1], value, span: [pos, pos + match[0].trimEnd().length]});
      }
    }
    offset += line.length;
  }
  const confirmed = found.some(tag => tag.name === 'file');
  return found.map(tag => ({...tag, evidence_state: confirmed ? 'confirmed' : 'candidate'}));
}
function directive(raw, span) {
  const match = raw.match(/^\/\*\*\*\s*(if\b[\s\S]*?|endif|else\b[\s\S]*?|elif\b[\s\S]*?)\s*\*\/$/);
  if (!match) return null;
  const value = match[1].trim();
  return {kind: value.split(/\s/)[0], value, span};
}
module.exports = {tags, directive};
