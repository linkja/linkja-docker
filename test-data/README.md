# Test Data

This includes a synthetic data set of 1,000 patients, a test public encryption key, as well as a test project salt file.  Do not use the public key or salt in any actual project.

The sample patients were created using the following Python script:

```
from faker import Faker
fake = Faker()
for i in range(1000):
  print("{0},{1},{2},{3},{4}".format(i, fake.first_name_male(),fake.last_name_male(),fake.ssn(taxpayer_identification_number_type="SSN"),fake.date(pattern="%Y-%m-%d", end_datetime=None)))
```
