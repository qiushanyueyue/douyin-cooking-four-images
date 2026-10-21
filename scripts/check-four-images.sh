#!/bin/bash
set -euo pipefail
node - "$1" <<'JS'
const fs=require('fs'),path=require('path');
const m=JSON.parse(fs.readFileSync(process.argv[2],'utf8'));
if(!m.dish || !Array.isArray(m.imagePrompts) || m.imagePrompts.length!==4) throw Error('dish or four imagePrompts missing');
if(!Array.isArray(m.images) || m.images.length!==4 || new Set(m.images).size!==4) throw Error('four distinct images required');
for(const p of m.images) if(!path.isAbsolute(p)||!fs.existsSync(p)||!fs.statSync(p).isFile()||fs.statSync(p).size===0) throw Error('invalid image: '+p);
console.log(JSON.stringify({ok:true,dish:m.dish,files:m.images.length,visualReviewRequired:true}));
JS
