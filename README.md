# OHDSI Achilles Analysis using SQLMesh

This is a working PoC of the use of [SQLMesh](https://sqlmesh.com/) to generate the [OHDSI Achilles](https://github.com/OHDSI/Achilles) analysis tables on an OMOP database.

This has been successfully run on OMOP in Databricks.
The use of [SQLGlot](https://sqlglot.com/) by SQLMesh allows this code to be used against any [supported databases](https://sqlmesh.readthedocs.io/en/stable/integrations/overview/#execution-engines).

The equivalent [dbt](https://getdbt.com) code for Databricks can be found here - <https://github.com/lsc-sde/dbt_achilles>

Related dbt projects:

- [Synthea-to-OMOP - SQLServer](https://github.com/vvcb/dbt-synthea/tree/vc/main)
- [Synthea-to-OMOP - Databricks](https://github.com/vvcb/dbt-synthea/tree/vc/databricks)
- [Synthea-to-OMOP from first principles](https://github.com/OHDSI/dbt-synthea)
