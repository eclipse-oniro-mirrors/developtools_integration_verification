'use strict';
// The only production module that knows how to load the compiler package.
const fs = require('node:fs');
const path = require('node:path');
const crypto = require('node:crypto');
function load(root, lock) {
  root = path.resolve(root);
  const pkg = JSON.parse(fs.readFileSync(path.join(root, 'package.json'), 'utf8'));
  const entry = path.join(root, 'lib/typescript.js');
  const hash = crypto.createHash('sha256').update(fs.readFileSync(entry)).digest('hex');
  if (!lock.node_versions.includes(process.version) || pkg.name !== lock.package_name ||
      pkg.version !== lock.package_version || hash !== lock.entry_sha256) {
    throw new Error('BACKEND_IDENTITY_MISMATCH');
  }
  const ts = require(entry);
  if (ts.version !== lock.compiler_version) throw new Error('BACKEND_IDENTITY_MISMATCH');
  return {
    identity: {package_name: pkg.name, package_version: pkg.version,
      compiler_version: ts.version, entry_sha256: hash},
    context(text, logicalPath, limits) {
      let source;
      return {ts, text, path: logicalPath, limits,
        ast() {
          if (!source) source = ts.createSourceFile(logicalPath, text, ts.ScriptTarget.Latest,
            true, ts.ScriptKind.TS);
          if (!Array.isArray(source.parseDiagnostics)) throw new Error('BACKEND_API_MISMATCH');
          return source;
        },
        scanner(fragment, onError) {
          return ts.createScanner(ts.ScriptTarget.Latest, false,
            ts.LanguageVariant.Standard, fragment, onError);
        }
      };
    }
  };
}
module.exports = {load};
