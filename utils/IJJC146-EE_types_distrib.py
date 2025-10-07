import matplotlib.pyplot as plt
import numpy as np

# Data
types = ['PER', 'ORG', 'LOC', 'DATE', 'MONEY', 'MISC']
totals = [4027, 3824, 884, 2993, 1098, 3808]
nils = [653, 443, 58, 0, 0, 0]

# Create figure
plt.figure(figsize=(8, 5), dpi=300)

x = np.arange(len(types))

# Plot total bars
bars = plt.bar(x, totals, color='#4C72B0', width=0.6, label='Total')

# Overlay NILs
plt.bar(x, nils, color='gray', alpha=0.6, width=0.6, label='NIL count')

# Add labels
for i, val in enumerate(totals):
    plt.text(i, val + max(totals)*0.015, f'{val:,}', ha='center', va='bottom', fontsize=9)
for i, val in enumerate(nils):
    if val > 0:
        plt.text(i, val/2, f'({val:,})', ha='center', va='center', color='white', fontsize=8)

# Customize
# plt.title('Entity Type Distribution (with NIL Counts)', fontsize=13, fontweight='bold')
plt.xlabel('Entity Type', fontsize=10)
plt.ylabel('Count', fontsize=10)
plt.xticks(x, types)
plt.grid(axis='y', linestyle='--', alpha=0.4)
plt.legend()

plt.tight_layout()
plt.savefig('images/ICCJ146-EE_entity_type_distribution.png', dpi=300, bbox_inches='tight')
plt.show()
