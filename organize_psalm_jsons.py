#!/usr/bin/env python3
"""
Cleanup and organize scattered psalm JSON files
Moves all psalm JSON files to the proper Resources directory
"""

import os
import shutil
import glob

# Directories
PROJECT_ROOT = '/Users/yegorhambaryan/Documents/2026/iOs developement/LetUsPray-'
RESOURCES_DIR = os.path.join(PROJECT_ROOT, 'LetUsPray/LetUsPray/Resources/Bible/Psalms')
OLD_RESOURCES = os.path.join(PROJECT_ROOT, 'Resources/Bible/Psalms')
SRC_DIR = os.path.join(PROJECT_ROOT, 'src')

def ensure_dir(directory):
    """Create directory if it doesn't exist"""
    os.makedirs(directory, exist_ok=True)

def find_all_psalm_jsons():
    """Find all psalm JSON files in the project"""
    patterns = [
        os.path.join(PROJECT_ROOT, 'psalm_*_verses.json'),
        os.path.join(PROJECT_ROOT, '*.json'),
        os.path.join(SRC_DIR, 'psalm_*_verses.json'),
        os.path.join(OLD_RESOURCES, 'psalm_*_verses.json'),
    ]
    
    files = []
    for pattern in patterns:
        files.extend(glob.glob(pattern))
    
    # Filter to only psalm files
    psalm_files = [f for f in files if 'psalm_' in os.path.basename(f) and '_verses.json' in f]
    return list(set(psalm_files))  # Remove duplicates

def organize_files():
    """Organize all psalm JSON files"""
    print("🔍 Searching for scattered psalm JSON files...\n")
    
    # Ensure target directory exists
    ensure_dir(RESOURCES_DIR)
    
    # Find all files
    files = find_all_psalm_jsons()
    
    if not files:
        print("✅ No scattered files found - everything is already organized!")
        return
    
    print(f"📦 Found {len(files)} psalm JSON files\n")
    
    moved = 0
    skipped = 0
    
    for file_path in files:
        filename = os.path.basename(file_path)
        target_path = os.path.join(RESOURCES_DIR, filename)
        
        # Skip if already in correct location
        if os.path.abspath(file_path) == os.path.abspath(target_path):
            print(f"✓ {filename} - already in correct location")
            skipped += 1
            continue
        
        # Check if target exists
        if os.path.exists(target_path):
            print(f"⚠️  {filename} - already exists in target, skipping")
            print(f"   Source: {file_path}")
            print(f"   Target: {target_path}")
            skipped += 1
            continue
        
        # Move the file
        try:
            shutil.copy2(file_path, target_path)
            print(f"📦 Moved: {filename}")
            print(f"   From: {file_path}")
            print(f"   To: {target_path}")
            moved += 1
        except Exception as e:
            print(f"❌ Error moving {filename}: {e}")
    
    print(f"\n{'='*60}")
    print(f"📊 Summary:")
    print(f"   ✅ Moved: {moved} files")
    print(f"   ⏭️  Skipped: {skipped} files")
    print(f"   📁 Target directory: {RESOURCES_DIR}")
    print(f"{'='*60}\n")
    
    if moved > 0:
        print("💡 Tip: You can now delete the scattered files from the old locations")
        print("   They are safely backed up in the Resources directory")

def list_available_psalms():
    """List all available psalm JSON files"""
    print(f"\n📋 Available psalm JSON files in {RESOURCES_DIR}:\n")
    
    files = glob.glob(os.path.join(RESOURCES_DIR, 'psalm_*_verses.json'))
    files.sort(key=lambda x: int(os.path.basename(x).split('_')[1]))
    
    if not files:
        print("   (none found)")
        return
    
    for file_path in files:
        filename = os.path.basename(file_path)
        psalm_num = filename.split('_')[1]
        print(f"   ✅ Psalm {psalm_num}: {filename}")
    
    print(f"\n   Total: {len(files)} psalm JSON files")

def main():
    print("=" * 60)
    print("🧹 PSALM JSON FILES CLEANUP AND ORGANIZATION")
    print("=" * 60)
    print()
    
    organize_files()
    list_available_psalms()
    
    print("\n✨ Done!\n")

if __name__ == "__main__":
    main()
