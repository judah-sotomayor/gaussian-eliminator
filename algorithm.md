Step 1 - Begin with the leftmost nonzero column. This is a pivot column. The pivot position is at the top.

Step 2 - Select a nonzero entry in the pivot column as a pivot. If necessary, interchange rows to move this entry into the pivot position.

Step 3 - Use row replacement operations to create zeros in all positions below the pivot.
    - Is there a value in the in the piviot column that is divisiable by the piviot value?
        - Yes: Do Row Reduction on that row (just the first one we encounter is fine)
        - No: Do Row Reduction on the row immediately below the row containing the pivot position presuming that the value below the pivot position is not zero.

